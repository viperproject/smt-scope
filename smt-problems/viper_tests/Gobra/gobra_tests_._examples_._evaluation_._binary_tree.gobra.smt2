(get-info :version)
; (:version "4.12.1")
; Started: 2023-10-31 14:09:41
; Silicon.version: 1.1-SNAPSHOT (46944a65@dspil_symbenchmarking)
; Input file: /home/pcorrect/repos/benchmarking_general/silicon_tests/gobra_tests_._examples_._evaluation_._binary_tree.gobra.vpr
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
(declare-sort ShStruct3<Ref~_Ref~_Ref> 0)
(declare-sort Tuple3<ShStruct3<Ref~_Ref~_Ref>~_Int~_ShStruct3<Ref~_Ref~_Ref>> 0)
(declare-sort Equality<ShStruct3<Ref~_Ref~_Ref>> 0)
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
(declare-fun $SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap (ShStruct3<Ref~_Ref~_Ref>) $Snap)
(declare-fun $SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap) ShStruct3<Ref~_Ref~_Ref>)
(assert (forall ((x ShStruct3<Ref~_Ref~_Ref>)) (!
    (= x ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref>($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap x)))
    :pattern (($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap x))
    :qid |$Snap.$SnapToShStruct3<Ref~_Ref~_Ref>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> x)))
    :pattern (($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> x))
    :qid |$Snap.ShStruct3<Ref~_Ref~_Ref>To$SnapToShStruct3<Ref~_Ref~_Ref>|
    )))
(declare-fun $SortWrappers.Tuple3<ShStruct3<Ref~_Ref~_Ref>~_Int~_ShStruct3<Ref~_Ref~_Ref>>To$Snap (Tuple3<ShStruct3<Ref~_Ref~_Ref>~_Int~_ShStruct3<Ref~_Ref~_Ref>>) $Snap)
(declare-fun $SortWrappers.$SnapToTuple3<ShStruct3<Ref~_Ref~_Ref>~_Int~_ShStruct3<Ref~_Ref~_Ref>> ($Snap) Tuple3<ShStruct3<Ref~_Ref~_Ref>~_Int~_ShStruct3<Ref~_Ref~_Ref>>)
(assert (forall ((x Tuple3<ShStruct3<Ref~_Ref~_Ref>~_Int~_ShStruct3<Ref~_Ref~_Ref>>)) (!
    (= x ($SortWrappers.$SnapToTuple3<ShStruct3<Ref~_Ref~_Ref>~_Int~_ShStruct3<Ref~_Ref~_Ref>>($SortWrappers.Tuple3<ShStruct3<Ref~_Ref~_Ref>~_Int~_ShStruct3<Ref~_Ref~_Ref>>To$Snap x)))
    :pattern (($SortWrappers.Tuple3<ShStruct3<Ref~_Ref~_Ref>~_Int~_ShStruct3<Ref~_Ref~_Ref>>To$Snap x))
    :qid |$Snap.$SnapToTuple3<ShStruct3<Ref~_Ref~_Ref>~_Int~_ShStruct3<Ref~_Ref~_Ref>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Tuple3<ShStruct3<Ref~_Ref~_Ref>~_Int~_ShStruct3<Ref~_Ref~_Ref>>To$Snap($SortWrappers.$SnapToTuple3<ShStruct3<Ref~_Ref~_Ref>~_Int~_ShStruct3<Ref~_Ref~_Ref>> x)))
    :pattern (($SortWrappers.$SnapToTuple3<ShStruct3<Ref~_Ref~_Ref>~_Int~_ShStruct3<Ref~_Ref~_Ref>> x))
    :qid |$Snap.Tuple3<ShStruct3<Ref~_Ref~_Ref>~_Int~_ShStruct3<Ref~_Ref~_Ref>>To$SnapToTuple3<ShStruct3<Ref~_Ref~_Ref>~_Int~_ShStruct3<Ref~_Ref~_Ref>>|
    )))
(declare-fun $SortWrappers.Equality<ShStruct3<Ref~_Ref~_Ref>>To$Snap (Equality<ShStruct3<Ref~_Ref~_Ref>>) $Snap)
(declare-fun $SortWrappers.$SnapToEquality<ShStruct3<Ref~_Ref~_Ref>> ($Snap) Equality<ShStruct3<Ref~_Ref~_Ref>>)
(assert (forall ((x Equality<ShStruct3<Ref~_Ref~_Ref>>)) (!
    (= x ($SortWrappers.$SnapToEquality<ShStruct3<Ref~_Ref~_Ref>>($SortWrappers.Equality<ShStruct3<Ref~_Ref~_Ref>>To$Snap x)))
    :pattern (($SortWrappers.Equality<ShStruct3<Ref~_Ref~_Ref>>To$Snap x))
    :qid |$Snap.$SnapToEquality<ShStruct3<Ref~_Ref~_Ref>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Equality<ShStruct3<Ref~_Ref~_Ref>>To$Snap($SortWrappers.$SnapToEquality<ShStruct3<Ref~_Ref~_Ref>> x)))
    :pattern (($SortWrappers.$SnapToEquality<ShStruct3<Ref~_Ref~_Ref>> x))
    :qid |$Snap.Equality<ShStruct3<Ref~_Ref~_Ref>>To$SnapToEquality<ShStruct3<Ref~_Ref~_Ref>>|
    )))
; ////////// Symbols
(declare-fun get0of3<ShStruct3<Ref~_Ref~_Ref>> (Tuple3<ShStruct3<Ref~_Ref~_Ref>~_Int~_ShStruct3<Ref~_Ref~_Ref>>) ShStruct3<Ref~_Ref~_Ref>)
(declare-fun get1of3<Int> (Tuple3<ShStruct3<Ref~_Ref~_Ref>~_Int~_ShStruct3<Ref~_Ref~_Ref>>) Int)
(declare-fun get2of3<ShStruct3<Ref~_Ref~_Ref>> (Tuple3<ShStruct3<Ref~_Ref~_Ref>~_Int~_ShStruct3<Ref~_Ref~_Ref>>) ShStruct3<Ref~_Ref~_Ref>)
(declare-fun tuple3<Tuple3<ShStruct3<Ref~_Ref~_Ref>~_Int~_ShStruct3<Ref~_Ref~_Ref>>> (ShStruct3<Ref~_Ref~_Ref> Int ShStruct3<Ref~_Ref~_Ref>) Tuple3<ShStruct3<Ref~_Ref~_Ref>~_Int~_ShStruct3<Ref~_Ref~_Ref>>)
(declare-fun ShStructget0of3<Ref> (ShStruct3<Ref~_Ref~_Ref>) $Ref)
(declare-fun ShStructget1of3<Ref> (ShStruct3<Ref~_Ref~_Ref>) $Ref)
(declare-fun ShStructget2of3<Ref> (ShStruct3<Ref~_Ref~_Ref>) $Ref)
(declare-fun ShStructrev0of3<ShStruct3<Ref~_Ref~_Ref>> ($Ref) ShStruct3<Ref~_Ref~_Ref>)
(declare-fun ShStructrev1of3<ShStruct3<Ref~_Ref~_Ref>> ($Ref) ShStruct3<Ref~_Ref~_Ref>)
(declare-fun ShStructrev2of3<ShStruct3<Ref~_Ref~_Ref>> ($Ref) ShStruct3<Ref~_Ref~_Ref>)
(declare-fun eq<Bool> (ShStruct3<Ref~_Ref~_Ref> ShStruct3<Ref~_Ref~_Ref>) Bool)
; Declaring symbols related to program functions (from program analysis)
(declare-fun shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ ($Snap) ShStruct3<Ref~_Ref~_Ref>)
(declare-fun shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$%limited ($Snap) ShStruct3<Ref~_Ref~_Ref>)
(declare-const shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$%stateless Bool)
(declare-fun shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$%precondition ($Snap) Bool)
(declare-fun Contains_8a1a376e_PMTree ($Snap ShStruct3<Ref~_Ref~_Ref> Int) Bool)
(declare-fun Contains_8a1a376e_PMTree%limited ($Snap ShStruct3<Ref~_Ref~_Ref> Int) Bool)
(declare-fun Contains_8a1a376e_PMTree%stateless (ShStruct3<Ref~_Ref~_Ref> Int) Bool)
(declare-fun Contains_8a1a376e_PMTree%precondition ($Snap ShStruct3<Ref~_Ref~_Ref> Int) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun tree_8a1a376e_F%trigger ($Snap ShStruct3<Ref~_Ref~_Ref>) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((t0 ShStruct3<Ref~_Ref~_Ref>) (t1 Int) (t2 ShStruct3<Ref~_Ref~_Ref>)) (!
  (and
    (=
      (get0of3<ShStruct3<Ref~_Ref~_Ref>> (tuple3<Tuple3<ShStruct3<Ref~_Ref~_Ref>~_Int~_ShStruct3<Ref~_Ref~_Ref>>> t0 t1 t2))
      t0)
    (and
      (=
        (get1of3<Int> (tuple3<Tuple3<ShStruct3<Ref~_Ref~_Ref>~_Int~_ShStruct3<Ref~_Ref~_Ref>>> t0 t1 t2))
        t1)
      (=
        (get2of3<ShStruct3<Ref~_Ref~_Ref>> (tuple3<Tuple3<ShStruct3<Ref~_Ref~_Ref>~_Int~_ShStruct3<Ref~_Ref~_Ref>>> t0 t1 t2))
        t2)))
  :pattern ((tuple3<Tuple3<ShStruct3<Ref~_Ref~_Ref>~_Int~_ShStruct3<Ref~_Ref~_Ref>>> t0 t1 t2))
  :qid |prog.getter_over_tuple3|)))
(assert (forall ((p Tuple3<ShStruct3<Ref~_Ref~_Ref>~_Int~_ShStruct3<Ref~_Ref~_Ref>>)) (!
  (=
    (tuple3<Tuple3<ShStruct3<Ref~_Ref~_Ref>~_Int~_ShStruct3<Ref~_Ref~_Ref>>> (get0of3<ShStruct3<Ref~_Ref~_Ref>> p) (get1of3<Int> p) (get2of3<ShStruct3<Ref~_Ref~_Ref>> p))
    p)
  :pattern ((get0of3<ShStruct3<Ref~_Ref~_Ref>> p))
  :pattern ((get1of3<Int> p))
  :pattern ((get2of3<ShStruct3<Ref~_Ref~_Ref>> p))
  :qid |prog.tuple3_over_getter|)))
(assert (forall ((x ShStruct3<Ref~_Ref~_Ref>)) (!
  (= (ShStructrev0of3<ShStruct3<Ref~_Ref~_Ref>> (ShStructget0of3<Ref> x)) x)
  :pattern ((ShStructget0of3<Ref> x))
  )))
(assert (forall ((x ShStruct3<Ref~_Ref~_Ref>)) (!
  (= (ShStructrev1of3<ShStruct3<Ref~_Ref~_Ref>> (ShStructget1of3<Ref> x)) x)
  :pattern ((ShStructget1of3<Ref> x))
  )))
(assert (forall ((x ShStruct3<Ref~_Ref~_Ref>)) (!
  (= (ShStructrev2of3<ShStruct3<Ref~_Ref~_Ref>> (ShStructget2of3<Ref> x)) x)
  :pattern ((ShStructget2of3<Ref> x))
  )))
(assert (forall ((x ShStruct3<Ref~_Ref~_Ref>) (y ShStruct3<Ref~_Ref~_Ref>)) (!
  (=
    (eq<Bool> x y)
    (and
      (= (ShStructget0of3<Ref> x) (ShStructget0of3<Ref> y))
      (and
        (= (ShStructget1of3<Ref> x) (ShStructget1of3<Ref> y))
        (= (ShStructget2of3<Ref> x) (ShStructget2of3<Ref> y)))))
  :pattern ((eq<Bool> x y))
  )))
(assert (forall ((l ShStruct3<Ref~_Ref~_Ref>) (r ShStruct3<Ref~_Ref~_Ref>)) (!
  (= (eq<Bool> l r) (= l r))
  :pattern ((eq<Bool> l r))
  )))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun joined_unfolding@5@00 ($Snap ShStruct3<Ref~_Ref~_Ref> Int) Bool)
(assert (forall ((s@$ $Snap)) (!
  (=
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$%limited s@$)
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ s@$))
  :pattern ((shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ s@$))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap)) (!
  (as shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$%stateless  Bool)
  :pattern ((shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$%limited s@$))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@0@00 (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$%limited s@$))) (=>
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$%precondition s@$)
    (and
      (= (ShStructget0of3<Ref> result@0@00) $Ref.null)
      (and
        (= (ShStructget1of3<Ref> result@0@00) $Ref.null)
        (= (ShStructget2of3<Ref> result@0@00) $Ref.null)))))
  :pattern ((shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$%limited s@$))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@0@00 (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$%limited s@$))) true)
  :pattern ((shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$%limited s@$))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (self_V0@1@00 ShStruct3<Ref~_Ref~_Ref>) (v_V0@2@00 Int)) (!
  (=
    (Contains_8a1a376e_PMTree%limited s@$ self_V0@1@00 v_V0@2@00)
    (Contains_8a1a376e_PMTree s@$ self_V0@1@00 v_V0@2@00))
  :pattern ((Contains_8a1a376e_PMTree s@$ self_V0@1@00 v_V0@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (self_V0@1@00 ShStruct3<Ref~_Ref~_Ref>) (v_V0@2@00 Int)) (!
  (Contains_8a1a376e_PMTree%stateless self_V0@1@00 v_V0@2@00)
  :pattern ((Contains_8a1a376e_PMTree%limited s@$ self_V0@1@00 v_V0@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (self_V0@1@00 ShStruct3<Ref~_Ref~_Ref>) (v_V0@2@00 Int)) (!
  (=>
    (Contains_8a1a376e_PMTree%precondition s@$ self_V0@1@00 v_V0@2@00)
    (=
      (Contains_8a1a376e_PMTree s@$ self_V0@1@00 v_V0@2@00)
      (and
        (not
          (=
            self_V0@1@00
            (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
        (or
          (=
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
            v_V0@2@00)
          (or
            (Contains_8a1a376e_PMTree%limited (ite
              (and
                (=
                  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first s@$))
                  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
                (not
                  (=
                    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
                    v_V0@2@00))
                (=
                  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
                  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
                (not
                  (=
                    self_V0@1@00
                    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
              $Snap.unit
              (ite
                (and
                  (=
                    ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first s@$))
                    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
                  (not
                    (=
                      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
                      v_V0@2@00))
                  (not
                    (=
                      ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
                      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
                  (not
                    (=
                      self_V0@1@00
                      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
                $Snap.unit
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first s@$)) v_V0@2@00)
            (Contains_8a1a376e_PMTree%limited (ite
              (and
                (not
                  (Contains_8a1a376e_PMTree $Snap.unit ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first s@$)) v_V0@2@00))
                (=
                  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
                  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
                (=
                  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first s@$))
                  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
                (not
                  (=
                    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
                    v_V0@2@00))
                (not
                  (=
                    self_V0@1@00
                    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
              $Snap.unit
              (ite
                (and
                  (not
                    (Contains_8a1a376e_PMTree $Snap.unit ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first s@$)) v_V0@2@00))
                  (not
                    (=
                      ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
                      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
                  (=
                    ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first s@$))
                    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
                  (not
                    (=
                      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
                      v_V0@2@00))
                  (not
                    (=
                      self_V0@1@00
                      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
                ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))
                (ite
                  (and
                    (not
                      (Contains_8a1a376e_PMTree ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first s@$)) v_V0@2@00))
                    (=
                      ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
                      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
                    (not
                      (=
                        ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first s@$))
                        (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
                    (not
                      (=
                        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
                        v_V0@2@00))
                    (not
                      (=
                        self_V0@1@00
                        (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
                  $Snap.unit
                  ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))) ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))) v_V0@2@00))))))
  :pattern ((Contains_8a1a376e_PMTree s@$ self_V0@1@00 v_V0@2@00))
  :pattern ((Contains_8a1a376e_PMTree%stateless self_V0@1@00 v_V0@2@00) (tree_8a1a376e_F%trigger s@$ self_V0@1@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (self_V0@1@00 ShStruct3<Ref~_Ref~_Ref>) (v_V0@2@00 Int)) (!
  (=>
    (Contains_8a1a376e_PMTree%precondition s@$ self_V0@1@00 v_V0@2@00)
    (and
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$%precondition $Snap.unit)
      (=>
        (and
          (not
            (=
              self_V0@1@00
              (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
          (not
            (=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
              v_V0@2@00)))
        (and
          (and
            (and
              (and
                (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$%precondition $Snap.unit)
                (=>
                  (and
                    (=
                      ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first s@$))
                      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
                    (not
                      (=
                        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
                        v_V0@2@00)))
                  (and
                    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$%precondition $Snap.unit)
                    (=>
                      (=
                        ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
                        (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
                      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$%precondition $Snap.unit)))))
              (ite
                (and
                  (=
                    ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first s@$))
                    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
                  (not
                    (=
                      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
                      v_V0@2@00))
                  (=
                    ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
                    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
                  (not
                    (=
                      self_V0@1@00
                      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
                true
                (and
                  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$%precondition $Snap.unit)
                  (=>
                    (and
                      (=
                        ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first s@$))
                        (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
                      (not
                        (=
                          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
                          v_V0@2@00)))
                    (and
                      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$%precondition $Snap.unit)
                      (=>
                        (not
                          (=
                            ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
                            (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
                        (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$%precondition $Snap.unit)))))))
            (Contains_8a1a376e_PMTree%precondition (ite
              (and
                (=
                  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first s@$))
                  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
                (not
                  (=
                    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
                    v_V0@2@00))
                (=
                  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
                  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
                (not
                  (=
                    self_V0@1@00
                    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
              $Snap.unit
              (ite
                (and
                  (=
                    ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first s@$))
                    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
                  (not
                    (=
                      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
                      v_V0@2@00))
                  (not
                    (=
                      ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
                      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
                  (not
                    (=
                      self_V0@1@00
                      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
                $Snap.unit
                ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first s@$)) v_V0@2@00))
          (=>
            (not
              (Contains_8a1a376e_PMTree%limited (ite
                (and
                  (=
                    ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first s@$))
                    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
                  (not
                    (=
                      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
                      v_V0@2@00))
                  (=
                    ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
                    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
                  (not
                    (=
                      self_V0@1@00
                      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
                $Snap.unit
                (ite
                  (and
                    (=
                      ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first s@$))
                      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
                    (not
                      (=
                        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
                        v_V0@2@00))
                    (not
                      (=
                        ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
                        (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
                    (not
                      (=
                        self_V0@1@00
                        (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
                  $Snap.unit
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first s@$)) v_V0@2@00))
            (and
              (and
                (and
                  (Contains_8a1a376e_PMTree%precondition $Snap.unit ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first s@$)) v_V0@2@00)
                  (=>
                    (not
                      (Contains_8a1a376e_PMTree $Snap.unit ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first s@$)) v_V0@2@00))
                    (and
                      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$%precondition $Snap.unit)
                      (=>
                        (=
                          ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
                          (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
                        (and
                          (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$%precondition $Snap.unit)
                          (=>
                            (and
                              (=
                                ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first s@$))
                                (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
                              (not
                                (=
                                  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
                                  v_V0@2@00)))
                            (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$%precondition $Snap.unit)))))))
                (ite
                  (and
                    (not
                      (Contains_8a1a376e_PMTree $Snap.unit ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first s@$)) v_V0@2@00))
                    (=
                      ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
                      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
                    (=
                      ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first s@$))
                      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
                    (not
                      (=
                        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
                        v_V0@2@00))
                    (not
                      (=
                        self_V0@1@00
                        (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
                  true
                  (and
                    (and
                      (Contains_8a1a376e_PMTree%precondition $Snap.unit ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first s@$)) v_V0@2@00)
                      (=>
                        (not
                          (Contains_8a1a376e_PMTree $Snap.unit ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first s@$)) v_V0@2@00))
                        (and
                          (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$%precondition $Snap.unit)
                          (=>
                            (not
                              (=
                                ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
                                (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
                            (and
                              (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$%precondition $Snap.unit)
                              (=>
                                (and
                                  (=
                                    ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first s@$))
                                    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
                                  (not
                                    (=
                                      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
                                      v_V0@2@00)))
                                (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$%precondition $Snap.unit)))))))
                    (ite
                      (and
                        (not
                          (Contains_8a1a376e_PMTree $Snap.unit ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first s@$)) v_V0@2@00))
                        (not
                          (=
                            ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
                            (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
                        (=
                          ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first s@$))
                          (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
                        (not
                          (=
                            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
                            v_V0@2@00))
                        (not
                          (=
                            self_V0@1@00
                            (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
                      true
                      (and
                        (Contains_8a1a376e_PMTree%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first s@$)) v_V0@2@00)
                        (=>
                          (not
                            (Contains_8a1a376e_PMTree ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first s@$)) v_V0@2@00))
                          (and
                            (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$%precondition $Snap.unit)
                            (=>
                              (=
                                ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
                                (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
                              (and
                                (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$%precondition $Snap.unit)
                                (=>
                                  (and
                                    (not
                                      (=
                                        ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first s@$))
                                        (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
                                    (not
                                      (=
                                        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
                                        v_V0@2@00)))
                                  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$%precondition $Snap.unit)))))))))))
              (Contains_8a1a376e_PMTree%precondition (ite
                (and
                  (not
                    (Contains_8a1a376e_PMTree $Snap.unit ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first s@$)) v_V0@2@00))
                  (=
                    ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
                    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
                  (=
                    ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first s@$))
                    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
                  (not
                    (=
                      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
                      v_V0@2@00))
                  (not
                    (=
                      self_V0@1@00
                      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
                $Snap.unit
                (ite
                  (and
                    (not
                      (Contains_8a1a376e_PMTree $Snap.unit ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first s@$)) v_V0@2@00))
                    (not
                      (=
                        ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
                        (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
                    (=
                      ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first s@$))
                      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
                    (not
                      (=
                        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
                        v_V0@2@00))
                    (not
                      (=
                        self_V0@1@00
                        (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
                  ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))
                  (ite
                    (and
                      (not
                        (Contains_8a1a376e_PMTree ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first s@$)) v_V0@2@00))
                      (=
                        ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second s@$))))
                        (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
                      (not
                        (=
                          ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first s@$))
                          (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
                      (not
                        (=
                          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
                          v_V0@2@00))
                      (not
                        (=
                          self_V0@1@00
                          (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
                    $Snap.unit
                    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))) ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second s@$)))) v_V0@2@00)))))))
  :pattern ((Contains_8a1a376e_PMTree s@$ self_V0@1@00 v_V0@2@00))
  :qid |quant-u-7|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- $IMPORTS_8a1a376e_8a1a376e ----------
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
; label returnLabel
(pop) ; 2
(pop) ; 1
; ---------- $INIT_8a1a376e_9ffd5623 ----------
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
; label returnLabel
(pop) ; 2
(pop) ; 1
; ---------- DeleteAll_8a1a376e_PMTree ----------
(declare-const self_V0@0@01 ShStruct3<Ref~_Ref~_Ref>)
(declare-const v_V0@1@01 Int)
(declare-const res_V0@2@01 ShStruct3<Ref~_Ref~_Ref>)
(declare-const self_V0@3@01 ShStruct3<Ref~_Ref~_Ref>)
(declare-const v_V0@4@01 Int)
(declare-const res_V0@5@01 ShStruct3<Ref~_Ref~_Ref>)
(push) ; 1
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 2
(assert (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$%precondition $Snap.unit))
(pop) ; 2
; Joined path conditions
(assert (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$%precondition $Snap.unit))
(push) ; 2
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (not
  (=
    self_V0@3@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
; [then-branch: 0 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 0 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 0 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    self_V0@3@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(declare-const $t@6@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(declare-const $t@7@01 $Snap)
(assert (= $t@7@01 ($Snap.combine ($Snap.first $t@7@01) ($Snap.second $t@7@01))))
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  res_V0@5@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@5@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 1 | res_V0@5@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 1 | res_V0@5@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 1 | res_V0@5@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    res_V0@5@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(assert (= ($Snap.second $t@7@01) $Snap.unit))
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 5
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  res_V0@5@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 2 | res_V0@5@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 2 | res_V0@5@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 2 | res_V0@5@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@7@01) res_V0@5@01 v_V0@4@01))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (not
    (=
      res_V0@5@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@7@01) res_V0@5@01 v_V0@4@01)))
(assert (not (Contains_8a1a376e_PMTree ($Snap.first $t@7@01) res_V0@5@01 v_V0@4@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 1 | res_V0@5@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  res_V0@5@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (= ($Snap.first $t@7@01) $Snap.unit))
(assert (= ($Snap.second $t@7@01) $Snap.unit))
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 5
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 6
(pop) ; 6
; Joined path conditions
; [then-branch: 3 | res_V0@5@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 3 | res_V0@5@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 6
; [else-branch: 3 | res_V0@5@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@5@01 v_V0@4@01))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (=
    res_V0@5@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@5@01 v_V0@4@01)))
(assert (not (Contains_8a1a376e_PMTree $Snap.unit res_V0@5@01 v_V0@4@01)))
(pop) ; 4
(pop) ; 3
(push) ; 3
; [exec]
; var res_V0_CN2: ShStruct3[Ref, Ref, Ref]
(declare-const res_V0_CN2@8@01 ShStruct3<Ref~_Ref~_Ref>)
; [exec]
; var v_V0_CN1: Int
(declare-const v_V0_CN1@9@01 Int)
; [exec]
; var self_V0_CN0: ShStruct3[Ref, Ref, Ref]
(declare-const self_V0_CN0@10@01 ShStruct3<Ref~_Ref~_Ref>)
; [exec]
; inhale res_V0 ==
;   shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(declare-const $t@11@01 $Snap)
(assert (= $t@11@01 $Snap.unit))
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 4
(pop) ; 4
; Joined path conditions
(assert (=
  res_V0@5@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale self_V0_CN0 ==
;   shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(declare-const $t@12@01 $Snap)
(assert (= $t@12@01 $Snap.unit))
; [eval] self_V0_CN0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 4
(pop) ; 4
; Joined path conditions
(assert (=
  self_V0_CN0@10@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale v_V0_CN1 == 0
(declare-const $t@13@01 $Snap)
(assert (= $t@13@01 $Snap.unit))
; [eval] v_V0_CN1 == 0
(assert (= v_V0_CN1@9@01 0))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale res_V0_CN2 ==
;   shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(declare-const $t@14@01 $Snap)
(assert (= $t@14@01 $Snap.unit))
; [eval] res_V0_CN2 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 4
(pop) ; 4
; Joined path conditions
(assert (=
  res_V0_CN2@8@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; self_V0_CN0 := self_V0
; [exec]
; v_V0_CN1 := v_V0
; [eval] self_V0_CN0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 4
(pop) ; 4
; Joined path conditions
; [then-branch: 4 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 4 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 4
; [else-branch: 4 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(pop) ; 4
; [eval] !(self_V0_CN0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0_CN0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 5 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 5 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 5 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [exec]
; var newRight_V1: ShStruct3[Ref, Ref, Ref]
(declare-const newRight_V1@15@01 ShStruct3<Ref~_Ref~_Ref>)
; [exec]
; var N5: ShStruct3[Ref, Ref, Ref]
(declare-const N5@16@01 ShStruct3<Ref~_Ref~_Ref>)
; [exec]
; var newLeft_V1: ShStruct3[Ref, Ref, Ref]
(declare-const newLeft_V1@17@01 ShStruct3<Ref~_Ref~_Ref>)
; [exec]
; var N4: ShStruct3[Ref, Ref, Ref]
(declare-const N4@18@01 ShStruct3<Ref~_Ref~_Ref>)
; [exec]
; unfold acc(tree_8a1a376e_F(self_V0_CN0), write)
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
; [eval] (ShStructget0of3(self_V0): Ref)
(assert (not (= (ShStructget0of3<Ref> self_V0@3@01) $Ref.null)))
(assert (=
  ($Snap.second $t@6@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.second ($Snap.second $t@6@01)))))
; [eval] (ShStructget1of3(self_V0): Ref)
(assert (not (= (ShStructget1of3<Ref> self_V0@3@01) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second $t@6@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@6@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))
; [eval] (ShStructget2of3(self_V0): Ref)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (ShStructget0of3<Ref> self_V0@3@01) (ShStructget2of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= (ShStructget2of3<Ref> self_V0@3@01) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@6@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01)))))))
; [eval] !((ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first $t@6@01))
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first $t@6@01))
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 6 | First:($t@6@01) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 6 | First:($t@6@01) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 6 | First:($t@6@01) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first $t@6@01))
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] !((ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second $t@6@01))))
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second $t@6@01))))
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 7 | First:(Second:(Second:($t@6@01))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 7 | First:(Second:(Second:($t@6@01))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 7 | First:(Second:(Second:($t@6@01))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second $t@6@01))))
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
; [eval] (ShStructget2of3(self_V0): Ref)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first $t@6@01))
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second $t@6@01)))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (tree_8a1a376e_F%trigger $t@6@01 self_V0@3@01))
; [exec]
; N4 := DeleteAll_8a1a376e_PMTree((ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$,
;   v_V0_CN1)
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first $t@6@01))
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 8 | First:($t@6@01) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 8 | First:($t@6@01) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 8 | First:($t@6@01) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(declare-const res_V0@19@01 ShStruct3<Ref~_Ref~_Ref>)
(declare-const $t@20@01 $Snap)
(assert (= $t@20@01 ($Snap.combine ($Snap.first $t@20@01) ($Snap.second $t@20@01))))
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 8
(pop) ; 8
; Joined path conditions
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  res_V0@19@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@19@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 9 | res_V0@19@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 9 | res_V0@19@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 9 | res_V0@19@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    res_V0@19@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second $t@6@01))))
  res_V0@19@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@20@01) $Snap.unit))
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(set-option :timeout 0)
(push) ; 9
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  res_V0@19@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 10 | res_V0@19@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 10 | res_V0@19@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 10 | res_V0@19@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@20@01) res_V0@19@01 v_V0@4@01))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (not
    (=
      res_V0@19@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@20@01) res_V0@19@01 v_V0@4@01)))
(assert (not (Contains_8a1a376e_PMTree ($Snap.first $t@20@01) res_V0@19@01 v_V0@4@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale newLeft_V1 ==
;   shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(declare-const $t@21@01 $Snap)
(assert (= $t@21@01 $Snap.unit))
; [eval] newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 9
(pop) ; 9
; Joined path conditions
(assert (=
  newLeft_V1@17@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; newLeft_V1 := N4
; [exec]
; N5 := DeleteAll_8a1a376e_PMTree((ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$,
;   v_V0_CN1)
; [eval] (ShStructget2of3(self_V0_CN0): Ref)
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second $t@6@01))))
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 11 | First:(Second:(Second:($t@6@01))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 11 | First:(Second:(Second:($t@6@01))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 11 | First:(Second:(Second:($t@6@01))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(declare-const res_V0@22@01 ShStruct3<Ref~_Ref~_Ref>)
(declare-const $t@23@01 $Snap)
(assert (= $t@23@01 ($Snap.combine ($Snap.first $t@23@01) ($Snap.second $t@23@01))))
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  res_V0@22@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@22@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 12 | res_V0@22@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 12 | res_V0@22@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 12 | res_V0@22@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    res_V0@22@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(push) ; 11
(set-option :timeout 10)
(assert (not (= res_V0@19@01 res_V0@22@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@23@01) $Snap.unit))
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(set-option :timeout 0)
(push) ; 11
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  res_V0@22@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 13 | res_V0@22@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 13 | res_V0@22@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 13 | res_V0@22@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@23@01) res_V0@22@01 v_V0@4@01))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (not
    (=
      res_V0@22@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@23@01) res_V0@22@01 v_V0@4@01)))
(assert (not (Contains_8a1a376e_PMTree ($Snap.first $t@23@01) res_V0@22@01 v_V0@4@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale newRight_V1 ==
;   shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(declare-const $t@24@01 $Snap)
(assert (= $t@24@01 $Snap.unit))
; [eval] newRight_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 11
(pop) ; 11
; Joined path conditions
(assert (=
  newRight_V1@15@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; newRight_V1 := N5
; [eval] (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 14 | First:(Second:($t@6@01)) == v_V0@4@01 | live]
; [else-branch: 14 | First:(Second:($t@6@01)) != v_V0@4@01 | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 14 | First:(Second:($t@6@01)) == v_V0@4@01]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))
; [eval] newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
; [then-branch: 15 | res_V0@19@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 15 | res_V0@19@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 12
; [else-branch: 15 | res_V0@19@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(pop) ; 12
; [eval] !(newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  res_V0@19@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 16 | res_V0@19@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 16 | res_V0@19@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 16 | res_V0@19@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] newRight_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 13
(pop) ; 13
; Joined path conditions
; [then-branch: 17 | res_V0@22@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 17 | res_V0@22@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 13
; [else-branch: 17 | res_V0@22@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(pop) ; 13
; [eval] !(newRight_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] newRight_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 13
(pop) ; 13
; Joined path conditions
(push) ; 13
(set-option :timeout 10)
(assert (not (=
  res_V0@22@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [then-branch: 18 | res_V0@22@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 18 | res_V0@22@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 18 | res_V0@22@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [exec]
; var N7: Int
(declare-const N7@25@01 Int)
; [exec]
; var N6: ShStruct3[Ref, Ref, Ref]
(declare-const N6@26@01 ShStruct3<Ref~_Ref~_Ref>)
; [exec]
; var leftMost_V2: Int
(declare-const leftMost_V2@27@01 Int)
; [exec]
; inhale leftMost_V2 == 0
(declare-const $t@28@01 $Snap)
(assert (= $t@28@01 $Snap.unit))
; [eval] leftMost_V2 == 0
(assert (= leftMost_V2@27@01 0))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; leftMost_V2 := 0
; [exec]
; N6, N7 := deleteLeftMost_8a1a376e_PMTree(newRight_V1, v_V0_CN1)
; [eval] !Contains_8a1a376e_PMTree(self_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(self_V0, v_V0)
(set-option :timeout 0)
(push) ; 14
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 15
(pop) ; 15
; Joined path conditions
(push) ; 15
(set-option :timeout 10)
(assert (not (=
  res_V0@22@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [then-branch: 19 | res_V0@22@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 19 | res_V0@22@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 15
; [then-branch: 19 | res_V0@22@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@23@01) res_V0@22@01 v_V0@4@01))
(pop) ; 15
(pop) ; 14
; Joined path conditions
(declare-const res_V0@29@01 ShStruct3<Ref~_Ref~_Ref>)
(declare-const leftMost_V0@30@01 Int)
(declare-const $t@31@01 $Snap)
(assert (= $t@31@01 ($Snap.combine ($Snap.first $t@31@01) ($Snap.second $t@31@01))))
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  res_V0@29@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@29@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [then-branch: 20 | res_V0@29@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 20 | res_V0@29@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 20 | res_V0@29@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    res_V0@29@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(push) ; 15
(set-option :timeout 10)
(assert (not (= res_V0@19@01 res_V0@29@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@31@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@31@01))
    ($Snap.second ($Snap.second $t@31@01)))))
(assert (= ($Snap.first ($Snap.second $t@31@01)) $Snap.unit))
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(set-option :timeout 0)
(push) ; 15
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(set-option :timeout 10)
(assert (not (=
  res_V0@29@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
; [then-branch: 21 | res_V0@29@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 21 | res_V0@29@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 16
; [then-branch: 21 | res_V0@29@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@31@01) res_V0@29@01 v_V0@4@01))
(pop) ; 16
(pop) ; 15
; Joined path conditions
(assert (=>
  (not
    (=
      res_V0@29@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@31@01) res_V0@29@01 v_V0@4@01)))
(assert (not (Contains_8a1a376e_PMTree ($Snap.first $t@31@01) res_V0@29@01 v_V0@4@01)))
(assert (= ($Snap.second ($Snap.second $t@31@01)) $Snap.unit))
; [eval] !(v_V0 == leftMost_V0)
; [eval] v_V0 == leftMost_V0
(assert (not (= v_V0@4@01 leftMost_V0@30@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; (ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := N6
; [eval] (ShStructget2of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= (ShStructget0of3<Ref> self_V0@3@01) (ShStructget2of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [exec]
; leftMost_V2 := N7
; [exec]
; (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ := leftMost_V2
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
; [exec]
; (ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := newLeft_V1
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= (ShStructget2of3<Ref> self_V0@3@01) (ShStructget0of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(tree_8a1a376e_F(self_V0_CN0), write)
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] (ShStructget1of3(self_V0): Ref)
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] !((ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 15
(pop) ; 15
; Joined path conditions
(push) ; 15
(set-option :timeout 10)
(assert (not (=
  res_V0@19@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [then-branch: 22 | res_V0@19@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 22 | res_V0@19@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 15
; [then-branch: 22 | res_V0@19@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] !((ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(set-option :timeout 10)
(assert (not (=
  res_V0@29@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
; [then-branch: 23 | res_V0@29@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 23 | res_V0@29@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 16
; [then-branch: 23 | res_V0@29@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] (ShStructget2of3(self_V0): Ref)
(assert (tree_8a1a376e_F%trigger ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@19@01)
  ($Snap.combine
    ($SortWrappers.IntTo$Snap leftMost_V0@30@01)
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@29@01)
      ($Snap.combine ($Snap.first $t@20@01) ($Snap.first $t@31@01))))) self_V0@3@01))
; [exec]
; res_V0_CN2 := self_V0_CN0
; [exec]
; res_V0_CN2 := res_V0_CN2
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 17
(pop) ; 17
; Joined path conditions
(push) ; 17
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
; [then-branch: 24 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 24 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 17
; [then-branch: 24 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 18
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 19
(pop) ; 19
; Joined path conditions
(push) ; 19
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
; [then-branch: 25 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 25 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 19
; [then-branch: 25 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@19@01)
  ($Snap.combine
    ($SortWrappers.IntTo$Snap leftMost_V0@30@01)
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@29@01)
      ($Snap.combine ($Snap.first $t@20@01) ($Snap.first $t@31@01))))) self_V0@3@01 v_V0@4@01))
(pop) ; 19
(pop) ; 18
; Joined path conditions
(assert (=>
  (not
    (=
      self_V0@3@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@19@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap leftMost_V0@30@01)
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@29@01)
        ($Snap.combine ($Snap.first $t@20@01) ($Snap.first $t@31@01))))) self_V0@3@01 v_V0@4@01)))
(push) ; 18
(assert (not (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@19@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap leftMost_V0@30@01)
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@29@01)
        ($Snap.combine ($Snap.first $t@20@01) ($Snap.first $t@31@01))))) self_V0@3@01 v_V0@4@01))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(assert (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@19@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap leftMost_V0@30@01)
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@29@01)
        ($Snap.combine ($Snap.first $t@20@01) ($Snap.first $t@31@01))))) self_V0@3@01 v_V0@4@01)))
(pop) ; 17
(pop) ; 16
(pop) ; 15
(pop) ; 14
(push) ; 14
; [else-branch: 20 | res_V0@29@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  res_V0@29@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (= ($Snap.first $t@31@01) $Snap.unit))
(assert (=
  ($Snap.second $t@31@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@31@01))
    ($Snap.second ($Snap.second $t@31@01)))))
(assert (= ($Snap.first ($Snap.second $t@31@01)) $Snap.unit))
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 15
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 16
(pop) ; 16
; Joined path conditions
; [then-branch: 26 | res_V0@29@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 26 | res_V0@29@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 16
; [else-branch: 26 | res_V0@29@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@29@01 v_V0@4@01))
(pop) ; 16
(pop) ; 15
; Joined path conditions
(assert (=>
  (=
    res_V0@29@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@29@01 v_V0@4@01)))
(assert (not (Contains_8a1a376e_PMTree $Snap.unit res_V0@29@01 v_V0@4@01)))
(assert (= ($Snap.second ($Snap.second $t@31@01)) $Snap.unit))
; [eval] !(v_V0 == leftMost_V0)
; [eval] v_V0 == leftMost_V0
(assert (not (= v_V0@4@01 leftMost_V0@30@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; (ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := N6
; [eval] (ShStructget2of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= (ShStructget0of3<Ref> self_V0@3@01) (ShStructget2of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [exec]
; leftMost_V2 := N7
; [exec]
; (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ := leftMost_V2
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
; [exec]
; (ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := newLeft_V1
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= (ShStructget2of3<Ref> self_V0@3@01) (ShStructget0of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(tree_8a1a376e_F(self_V0_CN0), write)
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] (ShStructget1of3(self_V0): Ref)
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] !((ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 15
(pop) ; 15
; Joined path conditions
(push) ; 15
(set-option :timeout 10)
(assert (not (=
  res_V0@19@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [then-branch: 27 | res_V0@19@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 27 | res_V0@19@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 15
; [then-branch: 27 | res_V0@19@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] !((ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 16
(pop) ; 16
; Joined path conditions
; [then-branch: 28 | res_V0@29@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 28 | res_V0@29@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 16
; [else-branch: 28 | res_V0@29@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (tree_8a1a376e_F%trigger ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@19@01)
  ($Snap.combine
    ($SortWrappers.IntTo$Snap leftMost_V0@30@01)
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@29@01)
      ($Snap.combine ($Snap.first $t@20@01) $Snap.unit)))) self_V0@3@01))
; [exec]
; res_V0_CN2 := self_V0_CN0
; [exec]
; res_V0_CN2 := res_V0_CN2
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 17
(pop) ; 17
; Joined path conditions
(push) ; 17
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
; [then-branch: 29 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 29 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 17
; [then-branch: 29 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 18
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 19
(pop) ; 19
; Joined path conditions
(push) ; 19
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
; [then-branch: 30 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 30 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 19
; [then-branch: 30 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@19@01)
  ($Snap.combine
    ($SortWrappers.IntTo$Snap leftMost_V0@30@01)
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@29@01)
      ($Snap.combine ($Snap.first $t@20@01) $Snap.unit)))) self_V0@3@01 v_V0@4@01))
(pop) ; 19
(pop) ; 18
; Joined path conditions
(assert (=>
  (not
    (=
      self_V0@3@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@19@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap leftMost_V0@30@01)
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@29@01)
        ($Snap.combine ($Snap.first $t@20@01) $Snap.unit)))) self_V0@3@01 v_V0@4@01)))
(push) ; 18
(assert (not (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@19@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap leftMost_V0@30@01)
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@29@01)
        ($Snap.combine ($Snap.first $t@20@01) $Snap.unit)))) self_V0@3@01 v_V0@4@01))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(assert (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@19@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap leftMost_V0@30@01)
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@29@01)
        ($Snap.combine ($Snap.first $t@20@01) $Snap.unit)))) self_V0@3@01 v_V0@4@01)))
(pop) ; 17
(pop) ; 16
(pop) ; 15
(pop) ; 14
(pop) ; 13
(pop) ; 12
(pop) ; 11
(push) ; 11
; [else-branch: 14 | First:(Second:($t@6@01)) != v_V0@4@01]
(assert (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(pop) ; 11
; [eval] !((ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1)
; [eval] (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 31 | First:(Second:($t@6@01)) != v_V0@4@01 | live]
; [else-branch: 31 | First:(Second:($t@6@01)) == v_V0@4@01 | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 31 | First:(Second:($t@6@01)) != v_V0@4@01]
(assert (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
; [exec]
; (ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := newLeft_V1
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
(push) ; 12
(set-option :timeout 10)
(assert (not (= (ShStructget2of3<Ref> self_V0@3@01) (ShStructget0of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; (ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := newRight_V1
; [eval] (ShStructget2of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= (ShStructget0of3<Ref> self_V0@3@01) (ShStructget2of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(tree_8a1a376e_F(self_V0_CN0), write)
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] (ShStructget1of3(self_V0): Ref)
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] !((ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  res_V0@19@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 32 | res_V0@19@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 32 | res_V0@19@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 32 | res_V0@19@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] !((ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 13
(pop) ; 13
; Joined path conditions
(push) ; 13
(set-option :timeout 10)
(assert (not (=
  res_V0@22@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [then-branch: 33 | res_V0@22@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 33 | res_V0@22@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 33 | res_V0@22@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] (ShStructget2of3(self_V0): Ref)
(assert (tree_8a1a376e_F%trigger ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@19@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@22@01)
      ($Snap.combine ($Snap.first $t@20@01) ($Snap.first $t@23@01))))) self_V0@3@01))
; [exec]
; res_V0_CN2 := self_V0_CN0
; [exec]
; res_V0_CN2 := res_V0_CN2
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [then-branch: 34 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 34 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 34 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 15
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
; [then-branch: 35 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 35 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 16
; [then-branch: 35 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@19@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@22@01)
      ($Snap.combine ($Snap.first $t@20@01) ($Snap.first $t@23@01))))) self_V0@3@01 v_V0@4@01))
(pop) ; 16
(pop) ; 15
; Joined path conditions
(assert (=>
  (not
    (=
      self_V0@3@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@19@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@22@01)
        ($Snap.combine ($Snap.first $t@20@01) ($Snap.first $t@23@01))))) self_V0@3@01 v_V0@4@01)))
(push) ; 15
(assert (not (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@19@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@22@01)
        ($Snap.combine ($Snap.first $t@20@01) ($Snap.first $t@23@01))))) self_V0@3@01 v_V0@4@01))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(assert (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@19@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@22@01)
        ($Snap.combine ($Snap.first $t@20@01) ($Snap.first $t@23@01))))) self_V0@3@01 v_V0@4@01)))
(pop) ; 14
(pop) ; 13
(pop) ; 12
(pop) ; 11
(push) ; 11
; [else-branch: 31 | First:(Second:($t@6@01)) == v_V0@4@01]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))
(pop) ; 11
(pop) ; 10
(push) ; 10
; [else-branch: 12 | res_V0@22@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  res_V0@22@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (= ($Snap.first $t@23@01) $Snap.unit))
(assert (= ($Snap.second $t@23@01) $Snap.unit))
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 11
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
; [then-branch: 36 | res_V0@22@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 36 | res_V0@22@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 12
; [else-branch: 36 | res_V0@22@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@22@01 v_V0@4@01))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (=
    res_V0@22@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@22@01 v_V0@4@01)))
(assert (not (Contains_8a1a376e_PMTree $Snap.unit res_V0@22@01 v_V0@4@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale newRight_V1 ==
;   shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(declare-const $t@32@01 $Snap)
(assert (= $t@32@01 $Snap.unit))
; [eval] newRight_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 11
(pop) ; 11
; Joined path conditions
(assert (=
  newRight_V1@15@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; newRight_V1 := N5
; [eval] (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 37 | First:(Second:($t@6@01)) == v_V0@4@01 | live]
; [else-branch: 37 | First:(Second:($t@6@01)) != v_V0@4@01 | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 37 | First:(Second:($t@6@01)) == v_V0@4@01]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))
; [eval] newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
; [then-branch: 38 | res_V0@19@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 38 | res_V0@19@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 12
; [else-branch: 38 | res_V0@19@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(pop) ; 12
; [eval] !(newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  res_V0@19@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 39 | res_V0@19@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 39 | res_V0@19@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 39 | res_V0@19@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] newRight_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 13
(pop) ; 13
; Joined path conditions
(push) ; 13
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@22@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [then-branch: 40 | res_V0@22@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 40 | res_V0@22@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 40 | res_V0@22@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [exec]
; res_V0_CN2 := newLeft_V1
; [exec]
; res_V0_CN2 := res_V0_CN2
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  res_V0@19@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [then-branch: 41 | res_V0@19@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 41 | res_V0@19@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 41 | res_V0@19@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 15
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(set-option :timeout 10)
(assert (not (=
  res_V0@19@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
; [then-branch: 42 | res_V0@19@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 42 | res_V0@19@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 16
; [then-branch: 42 | res_V0@19@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@20@01) res_V0@19@01 v_V0@4@01))
(pop) ; 16
(pop) ; 15
; Joined path conditions
(pop) ; 14
(pop) ; 13
; [eval] !(newRight_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] newRight_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 13
(pop) ; 13
; Joined path conditions
; [then-branch: 43 | res_V0@22@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 43 | res_V0@22@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 13
; [else-branch: 43 | res_V0@22@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(pop) ; 13
(pop) ; 12
(pop) ; 11
(push) ; 11
; [else-branch: 37 | First:(Second:($t@6@01)) != v_V0@4@01]
(assert (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(pop) ; 11
; [eval] !((ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1)
; [eval] (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 44 | First:(Second:($t@6@01)) != v_V0@4@01 | live]
; [else-branch: 44 | First:(Second:($t@6@01)) == v_V0@4@01 | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 44 | First:(Second:($t@6@01)) != v_V0@4@01]
(assert (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
; [exec]
; (ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := newLeft_V1
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
(push) ; 12
(set-option :timeout 10)
(assert (not (= (ShStructget2of3<Ref> self_V0@3@01) (ShStructget0of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; (ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := newRight_V1
; [eval] (ShStructget2of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= (ShStructget0of3<Ref> self_V0@3@01) (ShStructget2of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(tree_8a1a376e_F(self_V0_CN0), write)
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] (ShStructget1of3(self_V0): Ref)
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] !((ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  res_V0@19@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 45 | res_V0@19@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 45 | res_V0@19@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 45 | res_V0@19@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] !((ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 13
(pop) ; 13
; Joined path conditions
; [then-branch: 46 | res_V0@22@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 46 | res_V0@22@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 13
; [else-branch: 46 | res_V0@22@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (tree_8a1a376e_F%trigger ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@19@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@22@01)
      ($Snap.combine ($Snap.first $t@20@01) $Snap.unit)))) self_V0@3@01))
; [exec]
; res_V0_CN2 := self_V0_CN0
; [exec]
; res_V0_CN2 := res_V0_CN2
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [then-branch: 47 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 47 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 47 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 15
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
; [then-branch: 48 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 48 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 16
; [then-branch: 48 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@19@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@22@01)
      ($Snap.combine ($Snap.first $t@20@01) $Snap.unit)))) self_V0@3@01 v_V0@4@01))
(pop) ; 16
(pop) ; 15
; Joined path conditions
(assert (=>
  (not
    (=
      self_V0@3@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@19@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@22@01)
        ($Snap.combine ($Snap.first $t@20@01) $Snap.unit)))) self_V0@3@01 v_V0@4@01)))
(push) ; 15
(assert (not (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@19@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@22@01)
        ($Snap.combine ($Snap.first $t@20@01) $Snap.unit)))) self_V0@3@01 v_V0@4@01))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(assert (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@19@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@22@01)
        ($Snap.combine ($Snap.first $t@20@01) $Snap.unit)))) self_V0@3@01 v_V0@4@01)))
(pop) ; 14
(pop) ; 13
(pop) ; 12
(pop) ; 11
(push) ; 11
; [else-branch: 44 | First:(Second:($t@6@01)) == v_V0@4@01]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))
(pop) ; 11
(pop) ; 10
(pop) ; 9
(pop) ; 8
(push) ; 8
; [else-branch: 9 | res_V0@19@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  res_V0@19@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (= ($Snap.first $t@20@01) $Snap.unit))
(assert (= ($Snap.second $t@20@01) $Snap.unit))
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 9
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 10
(pop) ; 10
; Joined path conditions
; [then-branch: 49 | res_V0@19@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 49 | res_V0@19@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 10
; [else-branch: 49 | res_V0@19@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@19@01 v_V0@4@01))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (=
    res_V0@19@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@19@01 v_V0@4@01)))
(assert (not (Contains_8a1a376e_PMTree $Snap.unit res_V0@19@01 v_V0@4@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale newLeft_V1 ==
;   shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(declare-const $t@33@01 $Snap)
(assert (= $t@33@01 $Snap.unit))
; [eval] newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 9
(pop) ; 9
; Joined path conditions
(assert (=
  newLeft_V1@17@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; newLeft_V1 := N4
; [exec]
; N5 := DeleteAll_8a1a376e_PMTree((ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$,
;   v_V0_CN1)
; [eval] (ShStructget2of3(self_V0_CN0): Ref)
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second $t@6@01))))
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 50 | First:(Second:(Second:($t@6@01))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 50 | First:(Second:(Second:($t@6@01))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 50 | First:(Second:(Second:($t@6@01))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(declare-const res_V0@34@01 ShStruct3<Ref~_Ref~_Ref>)
(declare-const $t@35@01 $Snap)
(assert (= $t@35@01 ($Snap.combine ($Snap.first $t@35@01) ($Snap.second $t@35@01))))
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  res_V0@34@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@34@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 51 | res_V0@34@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 51 | res_V0@34@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 51 | res_V0@34@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    res_V0@34@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(assert (= ($Snap.second $t@35@01) $Snap.unit))
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 11
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  res_V0@34@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 52 | res_V0@34@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 52 | res_V0@34@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 52 | res_V0@34@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@35@01) res_V0@34@01 v_V0@4@01))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (not
    (=
      res_V0@34@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@35@01) res_V0@34@01 v_V0@4@01)))
(assert (not (Contains_8a1a376e_PMTree ($Snap.first $t@35@01) res_V0@34@01 v_V0@4@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale newRight_V1 ==
;   shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(declare-const $t@36@01 $Snap)
(assert (= $t@36@01 $Snap.unit))
; [eval] newRight_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 11
(pop) ; 11
; Joined path conditions
(assert (=
  newRight_V1@15@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; newRight_V1 := N5
; [eval] (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 53 | First:(Second:($t@6@01)) == v_V0@4@01 | live]
; [else-branch: 53 | First:(Second:($t@6@01)) != v_V0@4@01 | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 53 | First:(Second:($t@6@01)) == v_V0@4@01]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))
; [eval] newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@19@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 54 | res_V0@19@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 54 | res_V0@19@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 54 | res_V0@19@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [exec]
; res_V0_CN2 := newRight_V1
; [exec]
; res_V0_CN2 := res_V0_CN2
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 13
(pop) ; 13
; Joined path conditions
(push) ; 13
(set-option :timeout 10)
(assert (not (=
  res_V0@34@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [then-branch: 55 | res_V0@34@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 55 | res_V0@34@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 55 | res_V0@34@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 14
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 15
(pop) ; 15
; Joined path conditions
(push) ; 15
(set-option :timeout 10)
(assert (not (=
  res_V0@34@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [then-branch: 56 | res_V0@34@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 56 | res_V0@34@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 15
; [then-branch: 56 | res_V0@34@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@35@01) res_V0@34@01 v_V0@4@01))
(pop) ; 15
(pop) ; 14
; Joined path conditions
(pop) ; 13
(pop) ; 12
; [eval] !(newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
; [then-branch: 57 | res_V0@19@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 57 | res_V0@19@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 12
; [else-branch: 57 | res_V0@19@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(pop) ; 12
(pop) ; 11
(push) ; 11
; [else-branch: 53 | First:(Second:($t@6@01)) != v_V0@4@01]
(assert (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(pop) ; 11
; [eval] !((ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1)
; [eval] (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 58 | First:(Second:($t@6@01)) != v_V0@4@01 | live]
; [else-branch: 58 | First:(Second:($t@6@01)) == v_V0@4@01 | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 58 | First:(Second:($t@6@01)) != v_V0@4@01]
(assert (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
; [exec]
; (ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := newLeft_V1
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
(push) ; 12
(set-option :timeout 10)
(assert (not (= (ShStructget2of3<Ref> self_V0@3@01) (ShStructget0of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; (ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := newRight_V1
; [eval] (ShStructget2of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= (ShStructget0of3<Ref> self_V0@3@01) (ShStructget2of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(tree_8a1a376e_F(self_V0_CN0), write)
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] (ShStructget1of3(self_V0): Ref)
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] !((ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 12
(pop) ; 12
; Joined path conditions
; [then-branch: 59 | res_V0@19@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 59 | res_V0@19@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 12
; [else-branch: 59 | res_V0@19@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !((ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 13
(pop) ; 13
; Joined path conditions
(push) ; 13
(set-option :timeout 10)
(assert (not (=
  res_V0@34@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [then-branch: 60 | res_V0@34@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 60 | res_V0@34@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 60 | res_V0@34@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] (ShStructget2of3(self_V0): Ref)
(assert (tree_8a1a376e_F%trigger ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@19@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@34@01)
      ($Snap.combine $Snap.unit ($Snap.first $t@35@01))))) self_V0@3@01))
; [exec]
; res_V0_CN2 := self_V0_CN0
; [exec]
; res_V0_CN2 := res_V0_CN2
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [then-branch: 61 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 61 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 61 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 15
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
; [then-branch: 62 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 62 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 16
; [then-branch: 62 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@19@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@34@01)
      ($Snap.combine $Snap.unit ($Snap.first $t@35@01))))) self_V0@3@01 v_V0@4@01))
(pop) ; 16
(pop) ; 15
; Joined path conditions
(assert (=>
  (not
    (=
      self_V0@3@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@19@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@34@01)
        ($Snap.combine $Snap.unit ($Snap.first $t@35@01))))) self_V0@3@01 v_V0@4@01)))
(push) ; 15
(assert (not (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@19@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@34@01)
        ($Snap.combine $Snap.unit ($Snap.first $t@35@01))))) self_V0@3@01 v_V0@4@01))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(assert (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@19@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@34@01)
        ($Snap.combine $Snap.unit ($Snap.first $t@35@01))))) self_V0@3@01 v_V0@4@01)))
(pop) ; 14
(pop) ; 13
(pop) ; 12
(pop) ; 11
(push) ; 11
; [else-branch: 58 | First:(Second:($t@6@01)) == v_V0@4@01]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))
(pop) ; 11
(pop) ; 10
(push) ; 10
; [else-branch: 51 | res_V0@34@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  res_V0@34@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (= ($Snap.first $t@35@01) $Snap.unit))
(assert (= ($Snap.second $t@35@01) $Snap.unit))
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 11
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
; [then-branch: 63 | res_V0@34@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 63 | res_V0@34@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 12
; [else-branch: 63 | res_V0@34@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@34@01 v_V0@4@01))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (=
    res_V0@34@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@34@01 v_V0@4@01)))
(assert (not (Contains_8a1a376e_PMTree $Snap.unit res_V0@34@01 v_V0@4@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale newRight_V1 ==
;   shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(declare-const $t@37@01 $Snap)
(assert (= $t@37@01 $Snap.unit))
; [eval] newRight_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 11
(pop) ; 11
; Joined path conditions
(assert (=
  newRight_V1@15@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; newRight_V1 := N5
; [eval] (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 64 | First:(Second:($t@6@01)) == v_V0@4@01 | live]
; [else-branch: 64 | First:(Second:($t@6@01)) != v_V0@4@01 | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 64 | First:(Second:($t@6@01)) == v_V0@4@01]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))
; [eval] newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@19@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 65 | res_V0@19@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 65 | res_V0@19@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 65 | res_V0@19@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [exec]
; res_V0_CN2 := newRight_V1
; [exec]
; res_V0_CN2 := res_V0_CN2
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 13
(pop) ; 13
; Joined path conditions
; [then-branch: 66 | res_V0@34@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 66 | res_V0@34@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 13
; [else-branch: 66 | res_V0@34@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 14
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 15
(pop) ; 15
; Joined path conditions
; [then-branch: 67 | res_V0@34@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 67 | res_V0@34@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 15
; [else-branch: 67 | res_V0@34@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@34@01 v_V0@4@01))
(pop) ; 15
(pop) ; 14
; Joined path conditions
(pop) ; 13
(pop) ; 12
; [eval] !(newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
; [then-branch: 68 | res_V0@19@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 68 | res_V0@19@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 12
; [else-branch: 68 | res_V0@19@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(pop) ; 12
(pop) ; 11
(push) ; 11
; [else-branch: 64 | First:(Second:($t@6@01)) != v_V0@4@01]
(assert (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(pop) ; 11
; [eval] !((ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1)
; [eval] (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 69 | First:(Second:($t@6@01)) != v_V0@4@01 | live]
; [else-branch: 69 | First:(Second:($t@6@01)) == v_V0@4@01 | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 69 | First:(Second:($t@6@01)) != v_V0@4@01]
(assert (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
; [exec]
; (ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := newLeft_V1
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
(push) ; 12
(set-option :timeout 10)
(assert (not (= (ShStructget2of3<Ref> self_V0@3@01) (ShStructget0of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; (ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := newRight_V1
; [eval] (ShStructget2of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= (ShStructget0of3<Ref> self_V0@3@01) (ShStructget2of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(tree_8a1a376e_F(self_V0_CN0), write)
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] (ShStructget1of3(self_V0): Ref)
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] !((ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 12
(pop) ; 12
; Joined path conditions
; [then-branch: 70 | res_V0@19@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 70 | res_V0@19@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 12
; [else-branch: 70 | res_V0@19@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !((ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 13
(pop) ; 13
; Joined path conditions
; [then-branch: 71 | res_V0@34@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 71 | res_V0@34@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 13
; [else-branch: 71 | res_V0@34@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (tree_8a1a376e_F%trigger ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@19@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@34@01)
      ($Snap.combine $Snap.unit $Snap.unit)))) self_V0@3@01))
; [exec]
; res_V0_CN2 := self_V0_CN0
; [exec]
; res_V0_CN2 := res_V0_CN2
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [then-branch: 72 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 72 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 72 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 15
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
; [then-branch: 73 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 73 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 16
; [then-branch: 73 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@19@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@34@01)
      ($Snap.combine $Snap.unit $Snap.unit)))) self_V0@3@01 v_V0@4@01))
(pop) ; 16
(pop) ; 15
; Joined path conditions
(assert (=>
  (not
    (=
      self_V0@3@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@19@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@34@01)
        ($Snap.combine $Snap.unit $Snap.unit)))) self_V0@3@01 v_V0@4@01)))
(push) ; 15
(assert (not (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@19@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@34@01)
        ($Snap.combine $Snap.unit $Snap.unit)))) self_V0@3@01 v_V0@4@01))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(assert (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@19@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@34@01)
        ($Snap.combine $Snap.unit $Snap.unit)))) self_V0@3@01 v_V0@4@01)))
(pop) ; 14
(pop) ; 13
(pop) ; 12
(pop) ; 11
(push) ; 11
; [else-branch: 69 | First:(Second:($t@6@01)) == v_V0@4@01]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))
(pop) ; 11
(pop) ; 10
(pop) ; 9
(pop) ; 8
(pop) ; 7
(pop) ; 6
(push) ; 6
; [else-branch: 7 | First:(Second:(Second:($t@6@01))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second $t@6@01))))
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
  $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (tree_8a1a376e_F%trigger $t@6@01 self_V0@3@01))
; [exec]
; N4 := DeleteAll_8a1a376e_PMTree((ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$,
;   v_V0_CN1)
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first $t@6@01))
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 74 | First:($t@6@01) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 74 | First:($t@6@01) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 74 | First:($t@6@01) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(declare-const res_V0@38@01 ShStruct3<Ref~_Ref~_Ref>)
(declare-const $t@39@01 $Snap)
(assert (= $t@39@01 ($Snap.combine ($Snap.first $t@39@01) ($Snap.second $t@39@01))))
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 8
(pop) ; 8
; Joined path conditions
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  res_V0@38@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@38@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 75 | res_V0@38@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 75 | res_V0@38@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 75 | res_V0@38@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    res_V0@38@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(assert (= ($Snap.second $t@39@01) $Snap.unit))
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 9
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  res_V0@38@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 76 | res_V0@38@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 76 | res_V0@38@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 76 | res_V0@38@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@39@01) res_V0@38@01 v_V0@4@01))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (not
    (=
      res_V0@38@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@39@01) res_V0@38@01 v_V0@4@01)))
(assert (not (Contains_8a1a376e_PMTree ($Snap.first $t@39@01) res_V0@38@01 v_V0@4@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale newLeft_V1 ==
;   shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(declare-const $t@40@01 $Snap)
(assert (= $t@40@01 $Snap.unit))
; [eval] newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 9
(pop) ; 9
; Joined path conditions
(assert (=
  newLeft_V1@17@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; newLeft_V1 := N4
; [exec]
; N5 := DeleteAll_8a1a376e_PMTree((ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$,
;   v_V0_CN1)
; [eval] (ShStructget2of3(self_V0_CN0): Ref)
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 9
(pop) ; 9
; Joined path conditions
; [then-branch: 77 | First:(Second:(Second:($t@6@01))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 77 | First:(Second:(Second:($t@6@01))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 9
; [else-branch: 77 | First:(Second:(Second:($t@6@01))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(declare-const res_V0@41@01 ShStruct3<Ref~_Ref~_Ref>)
(declare-const $t@42@01 $Snap)
(assert (= $t@42@01 ($Snap.combine ($Snap.first $t@42@01) ($Snap.second $t@42@01))))
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  res_V0@41@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@41@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 78 | res_V0@41@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 78 | res_V0@41@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 78 | res_V0@41@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    res_V0@41@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(push) ; 11
(set-option :timeout 10)
(assert (not (= res_V0@38@01 res_V0@41@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@42@01) $Snap.unit))
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(set-option :timeout 0)
(push) ; 11
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  res_V0@41@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 79 | res_V0@41@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 79 | res_V0@41@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 79 | res_V0@41@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@42@01) res_V0@41@01 v_V0@4@01))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (not
    (=
      res_V0@41@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@42@01) res_V0@41@01 v_V0@4@01)))
(assert (not (Contains_8a1a376e_PMTree ($Snap.first $t@42@01) res_V0@41@01 v_V0@4@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale newRight_V1 ==
;   shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(declare-const $t@43@01 $Snap)
(assert (= $t@43@01 $Snap.unit))
; [eval] newRight_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 11
(pop) ; 11
; Joined path conditions
(assert (=
  newRight_V1@15@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; newRight_V1 := N5
; [eval] (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 80 | First:(Second:($t@6@01)) == v_V0@4@01 | live]
; [else-branch: 80 | First:(Second:($t@6@01)) != v_V0@4@01 | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 80 | First:(Second:($t@6@01)) == v_V0@4@01]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))
; [eval] newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
; [then-branch: 81 | res_V0@38@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 81 | res_V0@38@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 12
; [else-branch: 81 | res_V0@38@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(pop) ; 12
; [eval] !(newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  res_V0@38@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 82 | res_V0@38@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 82 | res_V0@38@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 82 | res_V0@38@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] newRight_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 13
(pop) ; 13
; Joined path conditions
; [then-branch: 83 | res_V0@41@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 83 | res_V0@41@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 13
; [else-branch: 83 | res_V0@41@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(pop) ; 13
; [eval] !(newRight_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] newRight_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 13
(pop) ; 13
; Joined path conditions
(push) ; 13
(set-option :timeout 10)
(assert (not (=
  res_V0@41@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 13
; 0.01s
; (get-info :all-statistics)
; [then-branch: 84 | res_V0@41@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 84 | res_V0@41@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 84 | res_V0@41@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [exec]
; var N7: Int
(declare-const N7@44@01 Int)
; [exec]
; var N6: ShStruct3[Ref, Ref, Ref]
(declare-const N6@45@01 ShStruct3<Ref~_Ref~_Ref>)
; [exec]
; var leftMost_V2: Int
(declare-const leftMost_V2@46@01 Int)
; [exec]
; inhale leftMost_V2 == 0
(declare-const $t@47@01 $Snap)
(assert (= $t@47@01 $Snap.unit))
; [eval] leftMost_V2 == 0
(assert (= leftMost_V2@46@01 0))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; leftMost_V2 := 0
; [exec]
; N6, N7 := deleteLeftMost_8a1a376e_PMTree(newRight_V1, v_V0_CN1)
; [eval] !Contains_8a1a376e_PMTree(self_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(self_V0, v_V0)
(set-option :timeout 0)
(push) ; 14
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 15
(pop) ; 15
; Joined path conditions
(push) ; 15
(set-option :timeout 10)
(assert (not (=
  res_V0@41@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [then-branch: 85 | res_V0@41@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 85 | res_V0@41@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 15
; [then-branch: 85 | res_V0@41@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@42@01) res_V0@41@01 v_V0@4@01))
(pop) ; 15
(pop) ; 14
; Joined path conditions
(declare-const res_V0@48@01 ShStruct3<Ref~_Ref~_Ref>)
(declare-const leftMost_V0@49@01 Int)
(declare-const $t@50@01 $Snap)
(assert (= $t@50@01 ($Snap.combine ($Snap.first $t@50@01) ($Snap.second $t@50@01))))
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  res_V0@48@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@48@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [then-branch: 86 | res_V0@48@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 86 | res_V0@48@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 86 | res_V0@48@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    res_V0@48@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(push) ; 15
(set-option :timeout 10)
(assert (not (= res_V0@38@01 res_V0@48@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@50@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@50@01))
    ($Snap.second ($Snap.second $t@50@01)))))
(assert (= ($Snap.first ($Snap.second $t@50@01)) $Snap.unit))
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(set-option :timeout 0)
(push) ; 15
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(set-option :timeout 10)
(assert (not (=
  res_V0@48@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
; [then-branch: 87 | res_V0@48@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 87 | res_V0@48@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 16
; [then-branch: 87 | res_V0@48@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@50@01) res_V0@48@01 v_V0@4@01))
(pop) ; 16
(pop) ; 15
; Joined path conditions
(assert (=>
  (not
    (=
      res_V0@48@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@50@01) res_V0@48@01 v_V0@4@01)))
(assert (not (Contains_8a1a376e_PMTree ($Snap.first $t@50@01) res_V0@48@01 v_V0@4@01)))
(assert (= ($Snap.second ($Snap.second $t@50@01)) $Snap.unit))
; [eval] !(v_V0 == leftMost_V0)
; [eval] v_V0 == leftMost_V0
(assert (not (= v_V0@4@01 leftMost_V0@49@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; (ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := N6
; [eval] (ShStructget2of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= (ShStructget0of3<Ref> self_V0@3@01) (ShStructget2of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [exec]
; leftMost_V2 := N7
; [exec]
; (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ := leftMost_V2
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
; [exec]
; (ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := newLeft_V1
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= (ShStructget2of3<Ref> self_V0@3@01) (ShStructget0of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(tree_8a1a376e_F(self_V0_CN0), write)
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] (ShStructget1of3(self_V0): Ref)
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] !((ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 15
(pop) ; 15
; Joined path conditions
(push) ; 15
(set-option :timeout 10)
(assert (not (=
  res_V0@38@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [then-branch: 88 | res_V0@38@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 88 | res_V0@38@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 15
; [then-branch: 88 | res_V0@38@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] !((ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(set-option :timeout 10)
(assert (not (=
  res_V0@48@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
; [then-branch: 89 | res_V0@48@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 89 | res_V0@48@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 16
; [then-branch: 89 | res_V0@48@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] (ShStructget2of3(self_V0): Ref)
(assert (tree_8a1a376e_F%trigger ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@38@01)
  ($Snap.combine
    ($SortWrappers.IntTo$Snap leftMost_V0@49@01)
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@48@01)
      ($Snap.combine ($Snap.first $t@39@01) ($Snap.first $t@50@01))))) self_V0@3@01))
; [exec]
; res_V0_CN2 := self_V0_CN0
; [exec]
; res_V0_CN2 := res_V0_CN2
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 17
(pop) ; 17
; Joined path conditions
(push) ; 17
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
; [then-branch: 90 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 90 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 17
; [then-branch: 90 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 18
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 19
(pop) ; 19
; Joined path conditions
(push) ; 19
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
; [then-branch: 91 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 91 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 19
; [then-branch: 91 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@38@01)
  ($Snap.combine
    ($SortWrappers.IntTo$Snap leftMost_V0@49@01)
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@48@01)
      ($Snap.combine ($Snap.first $t@39@01) ($Snap.first $t@50@01))))) self_V0@3@01 v_V0@4@01))
(pop) ; 19
(pop) ; 18
; Joined path conditions
(assert (=>
  (not
    (=
      self_V0@3@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@38@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap leftMost_V0@49@01)
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@48@01)
        ($Snap.combine ($Snap.first $t@39@01) ($Snap.first $t@50@01))))) self_V0@3@01 v_V0@4@01)))
(push) ; 18
(assert (not (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@38@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap leftMost_V0@49@01)
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@48@01)
        ($Snap.combine ($Snap.first $t@39@01) ($Snap.first $t@50@01))))) self_V0@3@01 v_V0@4@01))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(assert (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@38@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap leftMost_V0@49@01)
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@48@01)
        ($Snap.combine ($Snap.first $t@39@01) ($Snap.first $t@50@01))))) self_V0@3@01 v_V0@4@01)))
(pop) ; 17
(pop) ; 16
(pop) ; 15
(pop) ; 14
(push) ; 14
; [else-branch: 86 | res_V0@48@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  res_V0@48@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (= ($Snap.first $t@50@01) $Snap.unit))
(assert (=
  ($Snap.second $t@50@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@50@01))
    ($Snap.second ($Snap.second $t@50@01)))))
(assert (= ($Snap.first ($Snap.second $t@50@01)) $Snap.unit))
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 15
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 16
(pop) ; 16
; Joined path conditions
; [then-branch: 92 | res_V0@48@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 92 | res_V0@48@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 16
; [else-branch: 92 | res_V0@48@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@48@01 v_V0@4@01))
(pop) ; 16
(pop) ; 15
; Joined path conditions
(assert (=>
  (=
    res_V0@48@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@48@01 v_V0@4@01)))
(assert (not (Contains_8a1a376e_PMTree $Snap.unit res_V0@48@01 v_V0@4@01)))
(assert (= ($Snap.second ($Snap.second $t@50@01)) $Snap.unit))
; [eval] !(v_V0 == leftMost_V0)
; [eval] v_V0 == leftMost_V0
(assert (not (= v_V0@4@01 leftMost_V0@49@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; (ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := N6
; [eval] (ShStructget2of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= (ShStructget0of3<Ref> self_V0@3@01) (ShStructget2of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [exec]
; leftMost_V2 := N7
; [exec]
; (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ := leftMost_V2
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
; [exec]
; (ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := newLeft_V1
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= (ShStructget2of3<Ref> self_V0@3@01) (ShStructget0of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(tree_8a1a376e_F(self_V0_CN0), write)
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] (ShStructget1of3(self_V0): Ref)
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] !((ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 15
(pop) ; 15
; Joined path conditions
(push) ; 15
(set-option :timeout 10)
(assert (not (=
  res_V0@38@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [then-branch: 93 | res_V0@38@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 93 | res_V0@38@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 15
; [then-branch: 93 | res_V0@38@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] !((ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 16
(pop) ; 16
; Joined path conditions
; [then-branch: 94 | res_V0@48@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 94 | res_V0@48@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 16
; [else-branch: 94 | res_V0@48@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (tree_8a1a376e_F%trigger ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@38@01)
  ($Snap.combine
    ($SortWrappers.IntTo$Snap leftMost_V0@49@01)
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@48@01)
      ($Snap.combine ($Snap.first $t@39@01) $Snap.unit)))) self_V0@3@01))
; [exec]
; res_V0_CN2 := self_V0_CN0
; [exec]
; res_V0_CN2 := res_V0_CN2
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 17
(pop) ; 17
; Joined path conditions
(push) ; 17
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
; [then-branch: 95 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 95 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 17
; [then-branch: 95 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 18
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 19
(pop) ; 19
; Joined path conditions
(push) ; 19
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
; [then-branch: 96 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 96 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 19
; [then-branch: 96 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@38@01)
  ($Snap.combine
    ($SortWrappers.IntTo$Snap leftMost_V0@49@01)
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@48@01)
      ($Snap.combine ($Snap.first $t@39@01) $Snap.unit)))) self_V0@3@01 v_V0@4@01))
(pop) ; 19
(pop) ; 18
; Joined path conditions
(assert (=>
  (not
    (=
      self_V0@3@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@38@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap leftMost_V0@49@01)
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@48@01)
        ($Snap.combine ($Snap.first $t@39@01) $Snap.unit)))) self_V0@3@01 v_V0@4@01)))
(push) ; 18
(assert (not (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@38@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap leftMost_V0@49@01)
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@48@01)
        ($Snap.combine ($Snap.first $t@39@01) $Snap.unit)))) self_V0@3@01 v_V0@4@01))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(assert (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@38@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap leftMost_V0@49@01)
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@48@01)
        ($Snap.combine ($Snap.first $t@39@01) $Snap.unit)))) self_V0@3@01 v_V0@4@01)))
(pop) ; 17
(pop) ; 16
(pop) ; 15
(pop) ; 14
(pop) ; 13
(pop) ; 12
(pop) ; 11
(push) ; 11
; [else-branch: 80 | First:(Second:($t@6@01)) != v_V0@4@01]
(assert (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(pop) ; 11
; [eval] !((ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1)
; [eval] (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 97 | First:(Second:($t@6@01)) != v_V0@4@01 | live]
; [else-branch: 97 | First:(Second:($t@6@01)) == v_V0@4@01 | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 97 | First:(Second:($t@6@01)) != v_V0@4@01]
(assert (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
; [exec]
; (ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := newLeft_V1
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
(push) ; 12
(set-option :timeout 10)
(assert (not (= (ShStructget2of3<Ref> self_V0@3@01) (ShStructget0of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; (ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := newRight_V1
; [eval] (ShStructget2of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= (ShStructget0of3<Ref> self_V0@3@01) (ShStructget2of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(tree_8a1a376e_F(self_V0_CN0), write)
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] (ShStructget1of3(self_V0): Ref)
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] !((ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  res_V0@38@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 98 | res_V0@38@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 98 | res_V0@38@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 98 | res_V0@38@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] !((ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 13
(pop) ; 13
; Joined path conditions
(push) ; 13
(set-option :timeout 10)
(assert (not (=
  res_V0@41@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [then-branch: 99 | res_V0@41@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 99 | res_V0@41@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 99 | res_V0@41@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] (ShStructget2of3(self_V0): Ref)
(assert (tree_8a1a376e_F%trigger ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@38@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@41@01)
      ($Snap.combine ($Snap.first $t@39@01) ($Snap.first $t@42@01))))) self_V0@3@01))
; [exec]
; res_V0_CN2 := self_V0_CN0
; [exec]
; res_V0_CN2 := res_V0_CN2
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [then-branch: 100 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 100 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 100 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 15
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
; [then-branch: 101 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 101 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 16
; [then-branch: 101 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@38@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@41@01)
      ($Snap.combine ($Snap.first $t@39@01) ($Snap.first $t@42@01))))) self_V0@3@01 v_V0@4@01))
(pop) ; 16
(pop) ; 15
; Joined path conditions
(assert (=>
  (not
    (=
      self_V0@3@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@38@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@41@01)
        ($Snap.combine ($Snap.first $t@39@01) ($Snap.first $t@42@01))))) self_V0@3@01 v_V0@4@01)))
(push) ; 15
(assert (not (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@38@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@41@01)
        ($Snap.combine ($Snap.first $t@39@01) ($Snap.first $t@42@01))))) self_V0@3@01 v_V0@4@01))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(assert (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@38@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@41@01)
        ($Snap.combine ($Snap.first $t@39@01) ($Snap.first $t@42@01))))) self_V0@3@01 v_V0@4@01)))
(pop) ; 14
(pop) ; 13
(pop) ; 12
(pop) ; 11
(push) ; 11
; [else-branch: 97 | First:(Second:($t@6@01)) == v_V0@4@01]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))
(pop) ; 11
(pop) ; 10
(push) ; 10
; [else-branch: 78 | res_V0@41@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  res_V0@41@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (= ($Snap.first $t@42@01) $Snap.unit))
(assert (= ($Snap.second $t@42@01) $Snap.unit))
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 11
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
; [then-branch: 102 | res_V0@41@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 102 | res_V0@41@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 12
; [else-branch: 102 | res_V0@41@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@41@01 v_V0@4@01))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (=
    res_V0@41@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@41@01 v_V0@4@01)))
(assert (not (Contains_8a1a376e_PMTree $Snap.unit res_V0@41@01 v_V0@4@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale newRight_V1 ==
;   shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(declare-const $t@51@01 $Snap)
(assert (= $t@51@01 $Snap.unit))
; [eval] newRight_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 11
(pop) ; 11
; Joined path conditions
(assert (=
  newRight_V1@15@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; newRight_V1 := N5
; [eval] (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 103 | First:(Second:($t@6@01)) == v_V0@4@01 | live]
; [else-branch: 103 | First:(Second:($t@6@01)) != v_V0@4@01 | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 103 | First:(Second:($t@6@01)) == v_V0@4@01]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))
; [eval] newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
; [then-branch: 104 | res_V0@38@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 104 | res_V0@38@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 12
; [else-branch: 104 | res_V0@38@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(pop) ; 12
; [eval] !(newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  res_V0@38@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 105 | res_V0@38@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 105 | res_V0@38@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 105 | res_V0@38@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] newRight_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 13
(pop) ; 13
; Joined path conditions
(push) ; 13
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@41@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [then-branch: 106 | res_V0@41@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 106 | res_V0@41@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 106 | res_V0@41@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [exec]
; res_V0_CN2 := newLeft_V1
; [exec]
; res_V0_CN2 := res_V0_CN2
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  res_V0@38@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [then-branch: 107 | res_V0@38@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 107 | res_V0@38@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 107 | res_V0@38@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 15
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(set-option :timeout 10)
(assert (not (=
  res_V0@38@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
; [then-branch: 108 | res_V0@38@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 108 | res_V0@38@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 16
; [then-branch: 108 | res_V0@38@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@39@01) res_V0@38@01 v_V0@4@01))
(pop) ; 16
(pop) ; 15
; Joined path conditions
(pop) ; 14
(pop) ; 13
; [eval] !(newRight_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] newRight_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 13
(pop) ; 13
; Joined path conditions
; [then-branch: 109 | res_V0@41@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 109 | res_V0@41@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 13
; [else-branch: 109 | res_V0@41@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(pop) ; 13
(pop) ; 12
(pop) ; 11
(push) ; 11
; [else-branch: 103 | First:(Second:($t@6@01)) != v_V0@4@01]
(assert (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(pop) ; 11
; [eval] !((ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1)
; [eval] (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 110 | First:(Second:($t@6@01)) != v_V0@4@01 | live]
; [else-branch: 110 | First:(Second:($t@6@01)) == v_V0@4@01 | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 110 | First:(Second:($t@6@01)) != v_V0@4@01]
(assert (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
; [exec]
; (ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := newLeft_V1
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
(push) ; 12
(set-option :timeout 10)
(assert (not (= (ShStructget2of3<Ref> self_V0@3@01) (ShStructget0of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; (ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := newRight_V1
; [eval] (ShStructget2of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= (ShStructget0of3<Ref> self_V0@3@01) (ShStructget2of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(tree_8a1a376e_F(self_V0_CN0), write)
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] (ShStructget1of3(self_V0): Ref)
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] !((ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  res_V0@38@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 111 | res_V0@38@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 111 | res_V0@38@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 111 | res_V0@38@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] !((ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 13
(pop) ; 13
; Joined path conditions
; [then-branch: 112 | res_V0@41@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 112 | res_V0@41@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 13
; [else-branch: 112 | res_V0@41@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (tree_8a1a376e_F%trigger ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@38@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@41@01)
      ($Snap.combine ($Snap.first $t@39@01) $Snap.unit)))) self_V0@3@01))
; [exec]
; res_V0_CN2 := self_V0_CN0
; [exec]
; res_V0_CN2 := res_V0_CN2
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [then-branch: 113 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 113 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 113 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 15
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
; [then-branch: 114 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 114 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 16
; [then-branch: 114 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@38@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@41@01)
      ($Snap.combine ($Snap.first $t@39@01) $Snap.unit)))) self_V0@3@01 v_V0@4@01))
(pop) ; 16
(pop) ; 15
; Joined path conditions
(assert (=>
  (not
    (=
      self_V0@3@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@38@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@41@01)
        ($Snap.combine ($Snap.first $t@39@01) $Snap.unit)))) self_V0@3@01 v_V0@4@01)))
(push) ; 15
(assert (not (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@38@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@41@01)
        ($Snap.combine ($Snap.first $t@39@01) $Snap.unit)))) self_V0@3@01 v_V0@4@01))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(assert (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@38@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@41@01)
        ($Snap.combine ($Snap.first $t@39@01) $Snap.unit)))) self_V0@3@01 v_V0@4@01)))
(pop) ; 14
(pop) ; 13
(pop) ; 12
(pop) ; 11
(push) ; 11
; [else-branch: 110 | First:(Second:($t@6@01)) == v_V0@4@01]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))
(pop) ; 11
(pop) ; 10
(pop) ; 9
(pop) ; 8
(push) ; 8
; [else-branch: 75 | res_V0@38@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  res_V0@38@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (= ($Snap.first $t@39@01) $Snap.unit))
(assert (= ($Snap.second $t@39@01) $Snap.unit))
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 9
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 10
(pop) ; 10
; Joined path conditions
; [then-branch: 115 | res_V0@38@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 115 | res_V0@38@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 10
; [else-branch: 115 | res_V0@38@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@38@01 v_V0@4@01))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (=
    res_V0@38@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@38@01 v_V0@4@01)))
(assert (not (Contains_8a1a376e_PMTree $Snap.unit res_V0@38@01 v_V0@4@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale newLeft_V1 ==
;   shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(declare-const $t@52@01 $Snap)
(assert (= $t@52@01 $Snap.unit))
; [eval] newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 9
(pop) ; 9
; Joined path conditions
(assert (=
  newLeft_V1@17@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; newLeft_V1 := N4
; [exec]
; N5 := DeleteAll_8a1a376e_PMTree((ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$,
;   v_V0_CN1)
; [eval] (ShStructget2of3(self_V0_CN0): Ref)
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 9
(pop) ; 9
; Joined path conditions
; [then-branch: 116 | First:(Second:(Second:($t@6@01))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 116 | First:(Second:(Second:($t@6@01))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 9
; [else-branch: 116 | First:(Second:(Second:($t@6@01))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(declare-const res_V0@53@01 ShStruct3<Ref~_Ref~_Ref>)
(declare-const $t@54@01 $Snap)
(assert (= $t@54@01 ($Snap.combine ($Snap.first $t@54@01) ($Snap.second $t@54@01))))
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  res_V0@53@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@53@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 117 | res_V0@53@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 117 | res_V0@53@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 117 | res_V0@53@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    res_V0@53@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(assert (= ($Snap.second $t@54@01) $Snap.unit))
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 11
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  res_V0@53@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 118 | res_V0@53@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 118 | res_V0@53@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 118 | res_V0@53@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@54@01) res_V0@53@01 v_V0@4@01))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (not
    (=
      res_V0@53@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@54@01) res_V0@53@01 v_V0@4@01)))
(assert (not (Contains_8a1a376e_PMTree ($Snap.first $t@54@01) res_V0@53@01 v_V0@4@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale newRight_V1 ==
;   shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(declare-const $t@55@01 $Snap)
(assert (= $t@55@01 $Snap.unit))
; [eval] newRight_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 11
(pop) ; 11
; Joined path conditions
(assert (=
  newRight_V1@15@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; newRight_V1 := N5
; [eval] (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 119 | First:(Second:($t@6@01)) == v_V0@4@01 | live]
; [else-branch: 119 | First:(Second:($t@6@01)) != v_V0@4@01 | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 119 | First:(Second:($t@6@01)) == v_V0@4@01]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))
; [eval] newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@38@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 120 | res_V0@38@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 120 | res_V0@38@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 120 | res_V0@38@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [exec]
; res_V0_CN2 := newRight_V1
; [exec]
; res_V0_CN2 := res_V0_CN2
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 13
(pop) ; 13
; Joined path conditions
(push) ; 13
(set-option :timeout 10)
(assert (not (=
  res_V0@53@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [then-branch: 121 | res_V0@53@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 121 | res_V0@53@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 121 | res_V0@53@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 14
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 15
(pop) ; 15
; Joined path conditions
(push) ; 15
(set-option :timeout 10)
(assert (not (=
  res_V0@53@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [then-branch: 122 | res_V0@53@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 122 | res_V0@53@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 15
; [then-branch: 122 | res_V0@53@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@54@01) res_V0@53@01 v_V0@4@01))
(pop) ; 15
(pop) ; 14
; Joined path conditions
(pop) ; 13
(pop) ; 12
; [eval] !(newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
; [then-branch: 123 | res_V0@38@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 123 | res_V0@38@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 12
; [else-branch: 123 | res_V0@38@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(pop) ; 12
(pop) ; 11
(push) ; 11
; [else-branch: 119 | First:(Second:($t@6@01)) != v_V0@4@01]
(assert (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(pop) ; 11
; [eval] !((ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1)
; [eval] (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 124 | First:(Second:($t@6@01)) != v_V0@4@01 | live]
; [else-branch: 124 | First:(Second:($t@6@01)) == v_V0@4@01 | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 124 | First:(Second:($t@6@01)) != v_V0@4@01]
(assert (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
; [exec]
; (ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := newLeft_V1
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
(push) ; 12
(set-option :timeout 10)
(assert (not (= (ShStructget2of3<Ref> self_V0@3@01) (ShStructget0of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; (ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := newRight_V1
; [eval] (ShStructget2of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= (ShStructget0of3<Ref> self_V0@3@01) (ShStructget2of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(tree_8a1a376e_F(self_V0_CN0), write)
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] (ShStructget1of3(self_V0): Ref)
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] !((ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 12
(pop) ; 12
; Joined path conditions
; [then-branch: 125 | res_V0@38@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 125 | res_V0@38@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 12
; [else-branch: 125 | res_V0@38@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !((ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 13
(pop) ; 13
; Joined path conditions
(push) ; 13
(set-option :timeout 10)
(assert (not (=
  res_V0@53@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [then-branch: 126 | res_V0@53@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 126 | res_V0@53@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 126 | res_V0@53@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] (ShStructget2of3(self_V0): Ref)
(assert (tree_8a1a376e_F%trigger ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@38@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@53@01)
      ($Snap.combine $Snap.unit ($Snap.first $t@54@01))))) self_V0@3@01))
; [exec]
; res_V0_CN2 := self_V0_CN0
; [exec]
; res_V0_CN2 := res_V0_CN2
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [then-branch: 127 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 127 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 127 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 15
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
; [then-branch: 128 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 128 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 16
; [then-branch: 128 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@38@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@53@01)
      ($Snap.combine $Snap.unit ($Snap.first $t@54@01))))) self_V0@3@01 v_V0@4@01))
(pop) ; 16
(pop) ; 15
; Joined path conditions
(assert (=>
  (not
    (=
      self_V0@3@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@38@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@53@01)
        ($Snap.combine $Snap.unit ($Snap.first $t@54@01))))) self_V0@3@01 v_V0@4@01)))
(push) ; 15
(assert (not (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@38@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@53@01)
        ($Snap.combine $Snap.unit ($Snap.first $t@54@01))))) self_V0@3@01 v_V0@4@01))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(assert (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@38@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@53@01)
        ($Snap.combine $Snap.unit ($Snap.first $t@54@01))))) self_V0@3@01 v_V0@4@01)))
(pop) ; 14
(pop) ; 13
(pop) ; 12
(pop) ; 11
(push) ; 11
; [else-branch: 124 | First:(Second:($t@6@01)) == v_V0@4@01]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))
(pop) ; 11
(pop) ; 10
(push) ; 10
; [else-branch: 117 | res_V0@53@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  res_V0@53@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (= ($Snap.first $t@54@01) $Snap.unit))
(assert (= ($Snap.second $t@54@01) $Snap.unit))
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 11
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
; [then-branch: 129 | res_V0@53@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 129 | res_V0@53@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 12
; [else-branch: 129 | res_V0@53@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@53@01 v_V0@4@01))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (=
    res_V0@53@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@53@01 v_V0@4@01)))
(assert (not (Contains_8a1a376e_PMTree $Snap.unit res_V0@53@01 v_V0@4@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale newRight_V1 ==
;   shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(declare-const $t@56@01 $Snap)
(assert (= $t@56@01 $Snap.unit))
; [eval] newRight_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 11
(pop) ; 11
; Joined path conditions
(assert (=
  newRight_V1@15@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; newRight_V1 := N5
; [eval] (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 130 | First:(Second:($t@6@01)) == v_V0@4@01 | live]
; [else-branch: 130 | First:(Second:($t@6@01)) != v_V0@4@01 | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 130 | First:(Second:($t@6@01)) == v_V0@4@01]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))
; [eval] newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@38@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 131 | res_V0@38@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 131 | res_V0@38@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 131 | res_V0@38@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [exec]
; res_V0_CN2 := newRight_V1
; [exec]
; res_V0_CN2 := res_V0_CN2
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 13
(pop) ; 13
; Joined path conditions
; [then-branch: 132 | res_V0@53@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 132 | res_V0@53@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 13
; [else-branch: 132 | res_V0@53@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 14
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 15
(pop) ; 15
; Joined path conditions
; [then-branch: 133 | res_V0@53@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 133 | res_V0@53@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 15
; [else-branch: 133 | res_V0@53@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@53@01 v_V0@4@01))
(pop) ; 15
(pop) ; 14
; Joined path conditions
(pop) ; 13
(pop) ; 12
; [eval] !(newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
; [then-branch: 134 | res_V0@38@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 134 | res_V0@38@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 12
; [else-branch: 134 | res_V0@38@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(pop) ; 12
(pop) ; 11
(push) ; 11
; [else-branch: 130 | First:(Second:($t@6@01)) != v_V0@4@01]
(assert (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(pop) ; 11
; [eval] !((ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1)
; [eval] (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 135 | First:(Second:($t@6@01)) != v_V0@4@01 | live]
; [else-branch: 135 | First:(Second:($t@6@01)) == v_V0@4@01 | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 135 | First:(Second:($t@6@01)) != v_V0@4@01]
(assert (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
; [exec]
; (ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := newLeft_V1
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
(push) ; 12
(set-option :timeout 10)
(assert (not (= (ShStructget2of3<Ref> self_V0@3@01) (ShStructget0of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; (ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := newRight_V1
; [eval] (ShStructget2of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= (ShStructget0of3<Ref> self_V0@3@01) (ShStructget2of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(tree_8a1a376e_F(self_V0_CN0), write)
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] (ShStructget1of3(self_V0): Ref)
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] !((ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 12
(pop) ; 12
; Joined path conditions
; [then-branch: 136 | res_V0@38@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 136 | res_V0@38@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 12
; [else-branch: 136 | res_V0@38@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !((ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 13
(pop) ; 13
; Joined path conditions
; [then-branch: 137 | res_V0@53@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 137 | res_V0@53@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 13
; [else-branch: 137 | res_V0@53@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (tree_8a1a376e_F%trigger ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@38@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@53@01)
      ($Snap.combine $Snap.unit $Snap.unit)))) self_V0@3@01))
; [exec]
; res_V0_CN2 := self_V0_CN0
; [exec]
; res_V0_CN2 := res_V0_CN2
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [then-branch: 138 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 138 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 138 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 15
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
; [then-branch: 139 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 139 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 16
; [then-branch: 139 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@38@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@53@01)
      ($Snap.combine $Snap.unit $Snap.unit)))) self_V0@3@01 v_V0@4@01))
(pop) ; 16
(pop) ; 15
; Joined path conditions
(assert (=>
  (not
    (=
      self_V0@3@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@38@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@53@01)
        ($Snap.combine $Snap.unit $Snap.unit)))) self_V0@3@01 v_V0@4@01)))
(push) ; 15
(assert (not (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@38@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@53@01)
        ($Snap.combine $Snap.unit $Snap.unit)))) self_V0@3@01 v_V0@4@01))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(assert (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@38@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@53@01)
        ($Snap.combine $Snap.unit $Snap.unit)))) self_V0@3@01 v_V0@4@01)))
(pop) ; 14
(pop) ; 13
(pop) ; 12
(pop) ; 11
(push) ; 11
; [else-branch: 135 | First:(Second:($t@6@01)) == v_V0@4@01]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))
(pop) ; 11
(pop) ; 10
(pop) ; 9
(pop) ; 8
(pop) ; 7
(pop) ; 6
(pop) ; 5
(push) ; 5
; [else-branch: 6 | First:($t@6@01) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first $t@6@01))
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) $Snap.unit))
; [eval] !((ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second $t@6@01))))
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second $t@6@01))))
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 140 | First:(Second:(Second:($t@6@01))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 140 | First:(Second:(Second:($t@6@01))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 140 | First:(Second:(Second:($t@6@01))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second $t@6@01))))
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
; [eval] (ShStructget2of3(self_V0): Ref)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (tree_8a1a376e_F%trigger $t@6@01 self_V0@3@01))
; [exec]
; N4 := DeleteAll_8a1a376e_PMTree((ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$,
;   v_V0_CN1)
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 7
(pop) ; 7
; Joined path conditions
; [then-branch: 141 | First:($t@6@01) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 141 | First:($t@6@01) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 7
; [else-branch: 141 | First:($t@6@01) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(declare-const res_V0@57@01 ShStruct3<Ref~_Ref~_Ref>)
(declare-const $t@58@01 $Snap)
(assert (= $t@58@01 ($Snap.combine ($Snap.first $t@58@01) ($Snap.second $t@58@01))))
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 8
(pop) ; 8
; Joined path conditions
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  res_V0@57@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@57@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 142 | res_V0@57@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 142 | res_V0@57@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 142 | res_V0@57@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    res_V0@57@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second $t@6@01))))
  res_V0@57@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@58@01) $Snap.unit))
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(set-option :timeout 0)
(push) ; 9
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  res_V0@57@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 143 | res_V0@57@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 143 | res_V0@57@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 143 | res_V0@57@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@58@01) res_V0@57@01 v_V0@4@01))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (not
    (=
      res_V0@57@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@58@01) res_V0@57@01 v_V0@4@01)))
(assert (not (Contains_8a1a376e_PMTree ($Snap.first $t@58@01) res_V0@57@01 v_V0@4@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale newLeft_V1 ==
;   shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(declare-const $t@59@01 $Snap)
(assert (= $t@59@01 $Snap.unit))
; [eval] newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 9
(pop) ; 9
; Joined path conditions
(assert (=
  newLeft_V1@17@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; newLeft_V1 := N4
; [exec]
; N5 := DeleteAll_8a1a376e_PMTree((ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$,
;   v_V0_CN1)
; [eval] (ShStructget2of3(self_V0_CN0): Ref)
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second $t@6@01))))
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 144 | First:(Second:(Second:($t@6@01))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 144 | First:(Second:(Second:($t@6@01))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 144 | First:(Second:(Second:($t@6@01))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(declare-const res_V0@60@01 ShStruct3<Ref~_Ref~_Ref>)
(declare-const $t@61@01 $Snap)
(assert (= $t@61@01 ($Snap.combine ($Snap.first $t@61@01) ($Snap.second $t@61@01))))
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  res_V0@60@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@60@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 145 | res_V0@60@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 145 | res_V0@60@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 145 | res_V0@60@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    res_V0@60@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(push) ; 11
(set-option :timeout 10)
(assert (not (= res_V0@57@01 res_V0@60@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@61@01) $Snap.unit))
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(set-option :timeout 0)
(push) ; 11
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  res_V0@60@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 146 | res_V0@60@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 146 | res_V0@60@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 146 | res_V0@60@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@61@01) res_V0@60@01 v_V0@4@01))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (not
    (=
      res_V0@60@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@61@01) res_V0@60@01 v_V0@4@01)))
(assert (not (Contains_8a1a376e_PMTree ($Snap.first $t@61@01) res_V0@60@01 v_V0@4@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale newRight_V1 ==
;   shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(declare-const $t@62@01 $Snap)
(assert (= $t@62@01 $Snap.unit))
; [eval] newRight_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 11
(pop) ; 11
; Joined path conditions
(assert (=
  newRight_V1@15@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; newRight_V1 := N5
; [eval] (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 147 | First:(Second:($t@6@01)) == v_V0@4@01 | live]
; [else-branch: 147 | First:(Second:($t@6@01)) != v_V0@4@01 | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 147 | First:(Second:($t@6@01)) == v_V0@4@01]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))
; [eval] newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
; [then-branch: 148 | res_V0@57@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 148 | res_V0@57@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 12
; [else-branch: 148 | res_V0@57@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(pop) ; 12
; [eval] !(newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  res_V0@57@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 149 | res_V0@57@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 149 | res_V0@57@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 149 | res_V0@57@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] newRight_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 13
(pop) ; 13
; Joined path conditions
; [then-branch: 150 | res_V0@60@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 150 | res_V0@60@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 13
; [else-branch: 150 | res_V0@60@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(pop) ; 13
; [eval] !(newRight_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] newRight_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 13
(pop) ; 13
; Joined path conditions
(push) ; 13
(set-option :timeout 10)
(assert (not (=
  res_V0@60@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [then-branch: 151 | res_V0@60@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 151 | res_V0@60@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 151 | res_V0@60@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [exec]
; var N7: Int
(declare-const N7@63@01 Int)
; [exec]
; var N6: ShStruct3[Ref, Ref, Ref]
(declare-const N6@64@01 ShStruct3<Ref~_Ref~_Ref>)
; [exec]
; var leftMost_V2: Int
(declare-const leftMost_V2@65@01 Int)
; [exec]
; inhale leftMost_V2 == 0
(declare-const $t@66@01 $Snap)
(assert (= $t@66@01 $Snap.unit))
; [eval] leftMost_V2 == 0
(assert (= leftMost_V2@65@01 0))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; leftMost_V2 := 0
; [exec]
; N6, N7 := deleteLeftMost_8a1a376e_PMTree(newRight_V1, v_V0_CN1)
; [eval] !Contains_8a1a376e_PMTree(self_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(self_V0, v_V0)
(set-option :timeout 0)
(push) ; 14
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 15
(pop) ; 15
; Joined path conditions
(push) ; 15
(set-option :timeout 10)
(assert (not (=
  res_V0@60@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [then-branch: 152 | res_V0@60@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 152 | res_V0@60@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 15
; [then-branch: 152 | res_V0@60@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@61@01) res_V0@60@01 v_V0@4@01))
(pop) ; 15
(pop) ; 14
; Joined path conditions
(declare-const res_V0@67@01 ShStruct3<Ref~_Ref~_Ref>)
(declare-const leftMost_V0@68@01 Int)
(declare-const $t@69@01 $Snap)
(assert (= $t@69@01 ($Snap.combine ($Snap.first $t@69@01) ($Snap.second $t@69@01))))
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  res_V0@67@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@67@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [then-branch: 153 | res_V0@67@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 153 | res_V0@67@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 153 | res_V0@67@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    res_V0@67@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(push) ; 15
(set-option :timeout 10)
(assert (not (= res_V0@57@01 res_V0@67@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@69@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@69@01))
    ($Snap.second ($Snap.second $t@69@01)))))
(assert (= ($Snap.first ($Snap.second $t@69@01)) $Snap.unit))
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(set-option :timeout 0)
(push) ; 15
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(set-option :timeout 10)
(assert (not (=
  res_V0@67@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
; [then-branch: 154 | res_V0@67@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 154 | res_V0@67@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 16
; [then-branch: 154 | res_V0@67@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@69@01) res_V0@67@01 v_V0@4@01))
(pop) ; 16
(pop) ; 15
; Joined path conditions
(assert (=>
  (not
    (=
      res_V0@67@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@69@01) res_V0@67@01 v_V0@4@01)))
(assert (not (Contains_8a1a376e_PMTree ($Snap.first $t@69@01) res_V0@67@01 v_V0@4@01)))
(assert (= ($Snap.second ($Snap.second $t@69@01)) $Snap.unit))
; [eval] !(v_V0 == leftMost_V0)
; [eval] v_V0 == leftMost_V0
(assert (not (= v_V0@4@01 leftMost_V0@68@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; (ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := N6
; [eval] (ShStructget2of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= (ShStructget0of3<Ref> self_V0@3@01) (ShStructget2of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [exec]
; leftMost_V2 := N7
; [exec]
; (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ := leftMost_V2
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
; [exec]
; (ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := newLeft_V1
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= (ShStructget2of3<Ref> self_V0@3@01) (ShStructget0of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(tree_8a1a376e_F(self_V0_CN0), write)
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] (ShStructget1of3(self_V0): Ref)
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] !((ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 15
(pop) ; 15
; Joined path conditions
(push) ; 15
(set-option :timeout 10)
(assert (not (=
  res_V0@57@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [then-branch: 155 | res_V0@57@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 155 | res_V0@57@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 15
; [then-branch: 155 | res_V0@57@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] !((ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(set-option :timeout 10)
(assert (not (=
  res_V0@67@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
; [then-branch: 156 | res_V0@67@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 156 | res_V0@67@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 16
; [then-branch: 156 | res_V0@67@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] (ShStructget2of3(self_V0): Ref)
(assert (tree_8a1a376e_F%trigger ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@57@01)
  ($Snap.combine
    ($SortWrappers.IntTo$Snap leftMost_V0@68@01)
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@67@01)
      ($Snap.combine ($Snap.first $t@58@01) ($Snap.first $t@69@01))))) self_V0@3@01))
; [exec]
; res_V0_CN2 := self_V0_CN0
; [exec]
; res_V0_CN2 := res_V0_CN2
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 17
(pop) ; 17
; Joined path conditions
(push) ; 17
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
; [then-branch: 157 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 157 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 17
; [then-branch: 157 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 18
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 19
(pop) ; 19
; Joined path conditions
(push) ; 19
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
; [then-branch: 158 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 158 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 19
; [then-branch: 158 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@57@01)
  ($Snap.combine
    ($SortWrappers.IntTo$Snap leftMost_V0@68@01)
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@67@01)
      ($Snap.combine ($Snap.first $t@58@01) ($Snap.first $t@69@01))))) self_V0@3@01 v_V0@4@01))
(pop) ; 19
(pop) ; 18
; Joined path conditions
(assert (=>
  (not
    (=
      self_V0@3@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@57@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap leftMost_V0@68@01)
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@67@01)
        ($Snap.combine ($Snap.first $t@58@01) ($Snap.first $t@69@01))))) self_V0@3@01 v_V0@4@01)))
(push) ; 18
(assert (not (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@57@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap leftMost_V0@68@01)
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@67@01)
        ($Snap.combine ($Snap.first $t@58@01) ($Snap.first $t@69@01))))) self_V0@3@01 v_V0@4@01))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(assert (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@57@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap leftMost_V0@68@01)
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@67@01)
        ($Snap.combine ($Snap.first $t@58@01) ($Snap.first $t@69@01))))) self_V0@3@01 v_V0@4@01)))
(pop) ; 17
(pop) ; 16
(pop) ; 15
(pop) ; 14
(push) ; 14
; [else-branch: 153 | res_V0@67@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  res_V0@67@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (= ($Snap.first $t@69@01) $Snap.unit))
(assert (=
  ($Snap.second $t@69@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@69@01))
    ($Snap.second ($Snap.second $t@69@01)))))
(assert (= ($Snap.first ($Snap.second $t@69@01)) $Snap.unit))
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 15
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 16
(pop) ; 16
; Joined path conditions
; [then-branch: 159 | res_V0@67@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 159 | res_V0@67@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 16
; [else-branch: 159 | res_V0@67@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@67@01 v_V0@4@01))
(pop) ; 16
(pop) ; 15
; Joined path conditions
(assert (=>
  (=
    res_V0@67@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@67@01 v_V0@4@01)))
(assert (not (Contains_8a1a376e_PMTree $Snap.unit res_V0@67@01 v_V0@4@01)))
(assert (= ($Snap.second ($Snap.second $t@69@01)) $Snap.unit))
; [eval] !(v_V0 == leftMost_V0)
; [eval] v_V0 == leftMost_V0
(assert (not (= v_V0@4@01 leftMost_V0@68@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; (ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := N6
; [eval] (ShStructget2of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= (ShStructget0of3<Ref> self_V0@3@01) (ShStructget2of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [exec]
; leftMost_V2 := N7
; [exec]
; (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ := leftMost_V2
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
; [exec]
; (ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := newLeft_V1
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= (ShStructget2of3<Ref> self_V0@3@01) (ShStructget0of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(tree_8a1a376e_F(self_V0_CN0), write)
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] (ShStructget1of3(self_V0): Ref)
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] !((ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 15
(pop) ; 15
; Joined path conditions
(push) ; 15
(set-option :timeout 10)
(assert (not (=
  res_V0@57@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [then-branch: 160 | res_V0@57@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 160 | res_V0@57@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 15
; [then-branch: 160 | res_V0@57@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] !((ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 16
(pop) ; 16
; Joined path conditions
; [then-branch: 161 | res_V0@67@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 161 | res_V0@67@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 16
; [else-branch: 161 | res_V0@67@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (tree_8a1a376e_F%trigger ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@57@01)
  ($Snap.combine
    ($SortWrappers.IntTo$Snap leftMost_V0@68@01)
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@67@01)
      ($Snap.combine ($Snap.first $t@58@01) $Snap.unit)))) self_V0@3@01))
; [exec]
; res_V0_CN2 := self_V0_CN0
; [exec]
; res_V0_CN2 := res_V0_CN2
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 17
(pop) ; 17
; Joined path conditions
(push) ; 17
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
; [then-branch: 162 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 162 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 17
; [then-branch: 162 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 18
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 19
(pop) ; 19
; Joined path conditions
(push) ; 19
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
; [then-branch: 163 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 163 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 19
; [then-branch: 163 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@57@01)
  ($Snap.combine
    ($SortWrappers.IntTo$Snap leftMost_V0@68@01)
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@67@01)
      ($Snap.combine ($Snap.first $t@58@01) $Snap.unit)))) self_V0@3@01 v_V0@4@01))
(pop) ; 19
(pop) ; 18
; Joined path conditions
(assert (=>
  (not
    (=
      self_V0@3@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@57@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap leftMost_V0@68@01)
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@67@01)
        ($Snap.combine ($Snap.first $t@58@01) $Snap.unit)))) self_V0@3@01 v_V0@4@01)))
(push) ; 18
(assert (not (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@57@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap leftMost_V0@68@01)
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@67@01)
        ($Snap.combine ($Snap.first $t@58@01) $Snap.unit)))) self_V0@3@01 v_V0@4@01))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(assert (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@57@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap leftMost_V0@68@01)
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@67@01)
        ($Snap.combine ($Snap.first $t@58@01) $Snap.unit)))) self_V0@3@01 v_V0@4@01)))
(pop) ; 17
(pop) ; 16
(pop) ; 15
(pop) ; 14
(pop) ; 13
(pop) ; 12
(pop) ; 11
(push) ; 11
; [else-branch: 147 | First:(Second:($t@6@01)) != v_V0@4@01]
(assert (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(pop) ; 11
; [eval] !((ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1)
; [eval] (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 164 | First:(Second:($t@6@01)) != v_V0@4@01 | live]
; [else-branch: 164 | First:(Second:($t@6@01)) == v_V0@4@01 | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 164 | First:(Second:($t@6@01)) != v_V0@4@01]
(assert (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
; [exec]
; (ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := newLeft_V1
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
(push) ; 12
(set-option :timeout 10)
(assert (not (= (ShStructget2of3<Ref> self_V0@3@01) (ShStructget0of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; (ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := newRight_V1
; [eval] (ShStructget2of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= (ShStructget0of3<Ref> self_V0@3@01) (ShStructget2of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(tree_8a1a376e_F(self_V0_CN0), write)
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] (ShStructget1of3(self_V0): Ref)
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] !((ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  res_V0@57@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 165 | res_V0@57@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 165 | res_V0@57@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 165 | res_V0@57@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] !((ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 13
(pop) ; 13
; Joined path conditions
(push) ; 13
(set-option :timeout 10)
(assert (not (=
  res_V0@60@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [then-branch: 166 | res_V0@60@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 166 | res_V0@60@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 166 | res_V0@60@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] (ShStructget2of3(self_V0): Ref)
(assert (tree_8a1a376e_F%trigger ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@57@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@60@01)
      ($Snap.combine ($Snap.first $t@58@01) ($Snap.first $t@61@01))))) self_V0@3@01))
; [exec]
; res_V0_CN2 := self_V0_CN0
; [exec]
; res_V0_CN2 := res_V0_CN2
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [then-branch: 167 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 167 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 167 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 15
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
; [then-branch: 168 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 168 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 16
; [then-branch: 168 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@57@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@60@01)
      ($Snap.combine ($Snap.first $t@58@01) ($Snap.first $t@61@01))))) self_V0@3@01 v_V0@4@01))
(pop) ; 16
(pop) ; 15
; Joined path conditions
(assert (=>
  (not
    (=
      self_V0@3@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@57@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@60@01)
        ($Snap.combine ($Snap.first $t@58@01) ($Snap.first $t@61@01))))) self_V0@3@01 v_V0@4@01)))
(push) ; 15
(assert (not (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@57@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@60@01)
        ($Snap.combine ($Snap.first $t@58@01) ($Snap.first $t@61@01))))) self_V0@3@01 v_V0@4@01))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(assert (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@57@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@60@01)
        ($Snap.combine ($Snap.first $t@58@01) ($Snap.first $t@61@01))))) self_V0@3@01 v_V0@4@01)))
(pop) ; 14
(pop) ; 13
(pop) ; 12
(pop) ; 11
(push) ; 11
; [else-branch: 164 | First:(Second:($t@6@01)) == v_V0@4@01]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))
(pop) ; 11
(pop) ; 10
(push) ; 10
; [else-branch: 145 | res_V0@60@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  res_V0@60@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (= ($Snap.first $t@61@01) $Snap.unit))
(assert (= ($Snap.second $t@61@01) $Snap.unit))
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 11
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
; [then-branch: 169 | res_V0@60@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 169 | res_V0@60@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 12
; [else-branch: 169 | res_V0@60@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@60@01 v_V0@4@01))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (=
    res_V0@60@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@60@01 v_V0@4@01)))
(assert (not (Contains_8a1a376e_PMTree $Snap.unit res_V0@60@01 v_V0@4@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale newRight_V1 ==
;   shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(declare-const $t@70@01 $Snap)
(assert (= $t@70@01 $Snap.unit))
; [eval] newRight_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 11
(pop) ; 11
; Joined path conditions
(assert (=
  newRight_V1@15@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; newRight_V1 := N5
; [eval] (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 170 | First:(Second:($t@6@01)) == v_V0@4@01 | live]
; [else-branch: 170 | First:(Second:($t@6@01)) != v_V0@4@01 | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 170 | First:(Second:($t@6@01)) == v_V0@4@01]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))
; [eval] newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
; [then-branch: 171 | res_V0@57@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 171 | res_V0@57@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 12
; [else-branch: 171 | res_V0@57@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(pop) ; 12
; [eval] !(newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  res_V0@57@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 172 | res_V0@57@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 172 | res_V0@57@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 172 | res_V0@57@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] newRight_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 13
(pop) ; 13
; Joined path conditions
(push) ; 13
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@60@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [then-branch: 173 | res_V0@60@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 173 | res_V0@60@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 173 | res_V0@60@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [exec]
; res_V0_CN2 := newLeft_V1
; [exec]
; res_V0_CN2 := res_V0_CN2
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  res_V0@57@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [then-branch: 174 | res_V0@57@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 174 | res_V0@57@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 174 | res_V0@57@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 15
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(set-option :timeout 10)
(assert (not (=
  res_V0@57@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
; [then-branch: 175 | res_V0@57@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 175 | res_V0@57@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 16
; [then-branch: 175 | res_V0@57@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@58@01) res_V0@57@01 v_V0@4@01))
(pop) ; 16
(pop) ; 15
; Joined path conditions
(pop) ; 14
(pop) ; 13
; [eval] !(newRight_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] newRight_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 13
(pop) ; 13
; Joined path conditions
; [then-branch: 176 | res_V0@60@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 176 | res_V0@60@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 13
; [else-branch: 176 | res_V0@60@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(pop) ; 13
(pop) ; 12
(pop) ; 11
(push) ; 11
; [else-branch: 170 | First:(Second:($t@6@01)) != v_V0@4@01]
(assert (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(pop) ; 11
; [eval] !((ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1)
; [eval] (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 177 | First:(Second:($t@6@01)) != v_V0@4@01 | live]
; [else-branch: 177 | First:(Second:($t@6@01)) == v_V0@4@01 | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 177 | First:(Second:($t@6@01)) != v_V0@4@01]
(assert (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
; [exec]
; (ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := newLeft_V1
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
(push) ; 12
(set-option :timeout 10)
(assert (not (= (ShStructget2of3<Ref> self_V0@3@01) (ShStructget0of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; (ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := newRight_V1
; [eval] (ShStructget2of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= (ShStructget0of3<Ref> self_V0@3@01) (ShStructget2of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(tree_8a1a376e_F(self_V0_CN0), write)
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] (ShStructget1of3(self_V0): Ref)
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] !((ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  res_V0@57@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 178 | res_V0@57@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 178 | res_V0@57@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 178 | res_V0@57@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] !((ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 13
(pop) ; 13
; Joined path conditions
; [then-branch: 179 | res_V0@60@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 179 | res_V0@60@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 13
; [else-branch: 179 | res_V0@60@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (tree_8a1a376e_F%trigger ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@57@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@60@01)
      ($Snap.combine ($Snap.first $t@58@01) $Snap.unit)))) self_V0@3@01))
; [exec]
; res_V0_CN2 := self_V0_CN0
; [exec]
; res_V0_CN2 := res_V0_CN2
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [then-branch: 180 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 180 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 180 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 15
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
; [then-branch: 181 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 181 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 16
; [then-branch: 181 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@57@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@60@01)
      ($Snap.combine ($Snap.first $t@58@01) $Snap.unit)))) self_V0@3@01 v_V0@4@01))
(pop) ; 16
(pop) ; 15
; Joined path conditions
(assert (=>
  (not
    (=
      self_V0@3@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@57@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@60@01)
        ($Snap.combine ($Snap.first $t@58@01) $Snap.unit)))) self_V0@3@01 v_V0@4@01)))
(push) ; 15
(assert (not (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@57@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@60@01)
        ($Snap.combine ($Snap.first $t@58@01) $Snap.unit)))) self_V0@3@01 v_V0@4@01))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(assert (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@57@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@60@01)
        ($Snap.combine ($Snap.first $t@58@01) $Snap.unit)))) self_V0@3@01 v_V0@4@01)))
(pop) ; 14
(pop) ; 13
(pop) ; 12
(pop) ; 11
(push) ; 11
; [else-branch: 177 | First:(Second:($t@6@01)) == v_V0@4@01]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))
(pop) ; 11
(pop) ; 10
(pop) ; 9
(pop) ; 8
(push) ; 8
; [else-branch: 142 | res_V0@57@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  res_V0@57@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (= ($Snap.first $t@58@01) $Snap.unit))
(assert (= ($Snap.second $t@58@01) $Snap.unit))
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 9
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 10
(pop) ; 10
; Joined path conditions
; [then-branch: 182 | res_V0@57@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 182 | res_V0@57@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 10
; [else-branch: 182 | res_V0@57@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@57@01 v_V0@4@01))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (=
    res_V0@57@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@57@01 v_V0@4@01)))
(assert (not (Contains_8a1a376e_PMTree $Snap.unit res_V0@57@01 v_V0@4@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale newLeft_V1 ==
;   shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(declare-const $t@71@01 $Snap)
(assert (= $t@71@01 $Snap.unit))
; [eval] newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 9
(pop) ; 9
; Joined path conditions
(assert (=
  newLeft_V1@17@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; newLeft_V1 := N4
; [exec]
; N5 := DeleteAll_8a1a376e_PMTree((ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$,
;   v_V0_CN1)
; [eval] (ShStructget2of3(self_V0_CN0): Ref)
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second $t@6@01))))
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 183 | First:(Second:(Second:($t@6@01))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 183 | First:(Second:(Second:($t@6@01))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 183 | First:(Second:(Second:($t@6@01))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(declare-const res_V0@72@01 ShStruct3<Ref~_Ref~_Ref>)
(declare-const $t@73@01 $Snap)
(assert (= $t@73@01 ($Snap.combine ($Snap.first $t@73@01) ($Snap.second $t@73@01))))
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  res_V0@72@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@72@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 184 | res_V0@72@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 184 | res_V0@72@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 184 | res_V0@72@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    res_V0@72@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(assert (= ($Snap.second $t@73@01) $Snap.unit))
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 11
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  res_V0@72@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 185 | res_V0@72@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 185 | res_V0@72@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 185 | res_V0@72@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@73@01) res_V0@72@01 v_V0@4@01))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (not
    (=
      res_V0@72@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@73@01) res_V0@72@01 v_V0@4@01)))
(assert (not (Contains_8a1a376e_PMTree ($Snap.first $t@73@01) res_V0@72@01 v_V0@4@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale newRight_V1 ==
;   shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(declare-const $t@74@01 $Snap)
(assert (= $t@74@01 $Snap.unit))
; [eval] newRight_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 11
(pop) ; 11
; Joined path conditions
(assert (=
  newRight_V1@15@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; newRight_V1 := N5
; [eval] (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 186 | First:(Second:($t@6@01)) == v_V0@4@01 | live]
; [else-branch: 186 | First:(Second:($t@6@01)) != v_V0@4@01 | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 186 | First:(Second:($t@6@01)) == v_V0@4@01]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))
; [eval] newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@57@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 187 | res_V0@57@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 187 | res_V0@57@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 187 | res_V0@57@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [exec]
; res_V0_CN2 := newRight_V1
; [exec]
; res_V0_CN2 := res_V0_CN2
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 13
(pop) ; 13
; Joined path conditions
(push) ; 13
(set-option :timeout 10)
(assert (not (=
  res_V0@72@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [then-branch: 188 | res_V0@72@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 188 | res_V0@72@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 188 | res_V0@72@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 14
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 15
(pop) ; 15
; Joined path conditions
(push) ; 15
(set-option :timeout 10)
(assert (not (=
  res_V0@72@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [then-branch: 189 | res_V0@72@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 189 | res_V0@72@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 15
; [then-branch: 189 | res_V0@72@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@73@01) res_V0@72@01 v_V0@4@01))
(pop) ; 15
(pop) ; 14
; Joined path conditions
(pop) ; 13
(pop) ; 12
; [eval] !(newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
; [then-branch: 190 | res_V0@57@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 190 | res_V0@57@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 12
; [else-branch: 190 | res_V0@57@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(pop) ; 12
(pop) ; 11
(push) ; 11
; [else-branch: 186 | First:(Second:($t@6@01)) != v_V0@4@01]
(assert (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(pop) ; 11
; [eval] !((ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1)
; [eval] (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 191 | First:(Second:($t@6@01)) != v_V0@4@01 | live]
; [else-branch: 191 | First:(Second:($t@6@01)) == v_V0@4@01 | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 191 | First:(Second:($t@6@01)) != v_V0@4@01]
(assert (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
; [exec]
; (ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := newLeft_V1
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
(push) ; 12
(set-option :timeout 10)
(assert (not (= (ShStructget2of3<Ref> self_V0@3@01) (ShStructget0of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; (ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := newRight_V1
; [eval] (ShStructget2of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= (ShStructget0of3<Ref> self_V0@3@01) (ShStructget2of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(tree_8a1a376e_F(self_V0_CN0), write)
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] (ShStructget1of3(self_V0): Ref)
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] !((ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 12
(pop) ; 12
; Joined path conditions
; [then-branch: 192 | res_V0@57@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 192 | res_V0@57@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 12
; [else-branch: 192 | res_V0@57@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !((ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 13
(pop) ; 13
; Joined path conditions
(push) ; 13
(set-option :timeout 10)
(assert (not (=
  res_V0@72@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [then-branch: 193 | res_V0@72@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 193 | res_V0@72@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 193 | res_V0@72@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] (ShStructget2of3(self_V0): Ref)
(assert (tree_8a1a376e_F%trigger ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@57@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@72@01)
      ($Snap.combine $Snap.unit ($Snap.first $t@73@01))))) self_V0@3@01))
; [exec]
; res_V0_CN2 := self_V0_CN0
; [exec]
; res_V0_CN2 := res_V0_CN2
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [then-branch: 194 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 194 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 194 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 15
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
; [then-branch: 195 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 195 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 16
; [then-branch: 195 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@57@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@72@01)
      ($Snap.combine $Snap.unit ($Snap.first $t@73@01))))) self_V0@3@01 v_V0@4@01))
(pop) ; 16
(pop) ; 15
; Joined path conditions
(assert (=>
  (not
    (=
      self_V0@3@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@57@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@72@01)
        ($Snap.combine $Snap.unit ($Snap.first $t@73@01))))) self_V0@3@01 v_V0@4@01)))
(push) ; 15
(assert (not (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@57@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@72@01)
        ($Snap.combine $Snap.unit ($Snap.first $t@73@01))))) self_V0@3@01 v_V0@4@01))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(assert (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@57@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@72@01)
        ($Snap.combine $Snap.unit ($Snap.first $t@73@01))))) self_V0@3@01 v_V0@4@01)))
(pop) ; 14
(pop) ; 13
(pop) ; 12
(pop) ; 11
(push) ; 11
; [else-branch: 191 | First:(Second:($t@6@01)) == v_V0@4@01]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))
(pop) ; 11
(pop) ; 10
(push) ; 10
; [else-branch: 184 | res_V0@72@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  res_V0@72@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (= ($Snap.first $t@73@01) $Snap.unit))
(assert (= ($Snap.second $t@73@01) $Snap.unit))
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 11
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
; [then-branch: 196 | res_V0@72@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 196 | res_V0@72@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 12
; [else-branch: 196 | res_V0@72@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@72@01 v_V0@4@01))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (=
    res_V0@72@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@72@01 v_V0@4@01)))
(assert (not (Contains_8a1a376e_PMTree $Snap.unit res_V0@72@01 v_V0@4@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale newRight_V1 ==
;   shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(declare-const $t@75@01 $Snap)
(assert (= $t@75@01 $Snap.unit))
; [eval] newRight_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 11
(pop) ; 11
; Joined path conditions
(assert (=
  newRight_V1@15@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; newRight_V1 := N5
; [eval] (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 197 | First:(Second:($t@6@01)) == v_V0@4@01 | live]
; [else-branch: 197 | First:(Second:($t@6@01)) != v_V0@4@01 | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 197 | First:(Second:($t@6@01)) == v_V0@4@01]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))
; [eval] newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@57@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 198 | res_V0@57@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 198 | res_V0@57@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 198 | res_V0@57@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [exec]
; res_V0_CN2 := newRight_V1
; [exec]
; res_V0_CN2 := res_V0_CN2
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 13
(pop) ; 13
; Joined path conditions
; [then-branch: 199 | res_V0@72@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 199 | res_V0@72@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 13
; [else-branch: 199 | res_V0@72@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 14
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 15
(pop) ; 15
; Joined path conditions
; [then-branch: 200 | res_V0@72@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 200 | res_V0@72@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 15
; [else-branch: 200 | res_V0@72@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@72@01 v_V0@4@01))
(pop) ; 15
(pop) ; 14
; Joined path conditions
(pop) ; 13
(pop) ; 12
; [eval] !(newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
; [then-branch: 201 | res_V0@57@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 201 | res_V0@57@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 12
; [else-branch: 201 | res_V0@57@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(pop) ; 12
(pop) ; 11
(push) ; 11
; [else-branch: 197 | First:(Second:($t@6@01)) != v_V0@4@01]
(assert (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(pop) ; 11
; [eval] !((ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1)
; [eval] (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 202 | First:(Second:($t@6@01)) != v_V0@4@01 | live]
; [else-branch: 202 | First:(Second:($t@6@01)) == v_V0@4@01 | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 202 | First:(Second:($t@6@01)) != v_V0@4@01]
(assert (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
; [exec]
; (ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := newLeft_V1
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
(push) ; 12
(set-option :timeout 10)
(assert (not (= (ShStructget2of3<Ref> self_V0@3@01) (ShStructget0of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; (ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := newRight_V1
; [eval] (ShStructget2of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= (ShStructget0of3<Ref> self_V0@3@01) (ShStructget2of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(tree_8a1a376e_F(self_V0_CN0), write)
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] (ShStructget1of3(self_V0): Ref)
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] !((ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 12
(pop) ; 12
; Joined path conditions
; [then-branch: 203 | res_V0@57@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 203 | res_V0@57@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 12
; [else-branch: 203 | res_V0@57@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !((ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 13
(pop) ; 13
; Joined path conditions
; [then-branch: 204 | res_V0@72@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 204 | res_V0@72@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 13
; [else-branch: 204 | res_V0@72@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (tree_8a1a376e_F%trigger ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@57@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@72@01)
      ($Snap.combine $Snap.unit $Snap.unit)))) self_V0@3@01))
; [exec]
; res_V0_CN2 := self_V0_CN0
; [exec]
; res_V0_CN2 := res_V0_CN2
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [then-branch: 205 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 205 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 205 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 15
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
; [then-branch: 206 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 206 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 16
; [then-branch: 206 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@57@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@72@01)
      ($Snap.combine $Snap.unit $Snap.unit)))) self_V0@3@01 v_V0@4@01))
(pop) ; 16
(pop) ; 15
; Joined path conditions
(assert (=>
  (not
    (=
      self_V0@3@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@57@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@72@01)
        ($Snap.combine $Snap.unit $Snap.unit)))) self_V0@3@01 v_V0@4@01)))
(push) ; 15
(assert (not (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@57@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@72@01)
        ($Snap.combine $Snap.unit $Snap.unit)))) self_V0@3@01 v_V0@4@01))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(assert (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@57@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@72@01)
        ($Snap.combine $Snap.unit $Snap.unit)))) self_V0@3@01 v_V0@4@01)))
(pop) ; 14
(pop) ; 13
(pop) ; 12
(pop) ; 11
(push) ; 11
; [else-branch: 202 | First:(Second:($t@6@01)) == v_V0@4@01]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))
(pop) ; 11
(pop) ; 10
(pop) ; 9
(pop) ; 8
(pop) ; 7
(pop) ; 6
(push) ; 6
; [else-branch: 140 | First:(Second:(Second:($t@6@01))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second $t@6@01))))
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
  $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (tree_8a1a376e_F%trigger $t@6@01 self_V0@3@01))
; [exec]
; N4 := DeleteAll_8a1a376e_PMTree((ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$,
;   v_V0_CN1)
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 7
(pop) ; 7
; Joined path conditions
; [then-branch: 207 | First:($t@6@01) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 207 | First:($t@6@01) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 7
; [else-branch: 207 | First:($t@6@01) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(declare-const res_V0@76@01 ShStruct3<Ref~_Ref~_Ref>)
(declare-const $t@77@01 $Snap)
(assert (= $t@77@01 ($Snap.combine ($Snap.first $t@77@01) ($Snap.second $t@77@01))))
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 8
(pop) ; 8
; Joined path conditions
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  res_V0@76@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@76@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 208 | res_V0@76@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 208 | res_V0@76@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 208 | res_V0@76@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    res_V0@76@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(assert (= ($Snap.second $t@77@01) $Snap.unit))
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 9
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  res_V0@76@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 209 | res_V0@76@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 209 | res_V0@76@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 209 | res_V0@76@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@77@01) res_V0@76@01 v_V0@4@01))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (not
    (=
      res_V0@76@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@77@01) res_V0@76@01 v_V0@4@01)))
(assert (not (Contains_8a1a376e_PMTree ($Snap.first $t@77@01) res_V0@76@01 v_V0@4@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale newLeft_V1 ==
;   shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(declare-const $t@78@01 $Snap)
(assert (= $t@78@01 $Snap.unit))
; [eval] newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 9
(pop) ; 9
; Joined path conditions
(assert (=
  newLeft_V1@17@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; newLeft_V1 := N4
; [exec]
; N5 := DeleteAll_8a1a376e_PMTree((ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$,
;   v_V0_CN1)
; [eval] (ShStructget2of3(self_V0_CN0): Ref)
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 9
(pop) ; 9
; Joined path conditions
; [then-branch: 210 | First:(Second:(Second:($t@6@01))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 210 | First:(Second:(Second:($t@6@01))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 9
; [else-branch: 210 | First:(Second:(Second:($t@6@01))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(declare-const res_V0@79@01 ShStruct3<Ref~_Ref~_Ref>)
(declare-const $t@80@01 $Snap)
(assert (= $t@80@01 ($Snap.combine ($Snap.first $t@80@01) ($Snap.second $t@80@01))))
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  res_V0@79@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@79@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 211 | res_V0@79@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 211 | res_V0@79@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 211 | res_V0@79@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    res_V0@79@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(push) ; 11
(set-option :timeout 10)
(assert (not (= res_V0@76@01 res_V0@79@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@80@01) $Snap.unit))
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(set-option :timeout 0)
(push) ; 11
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  res_V0@79@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 212 | res_V0@79@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 212 | res_V0@79@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 212 | res_V0@79@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@80@01) res_V0@79@01 v_V0@4@01))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (not
    (=
      res_V0@79@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@80@01) res_V0@79@01 v_V0@4@01)))
(assert (not (Contains_8a1a376e_PMTree ($Snap.first $t@80@01) res_V0@79@01 v_V0@4@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale newRight_V1 ==
;   shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(declare-const $t@81@01 $Snap)
(assert (= $t@81@01 $Snap.unit))
; [eval] newRight_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 11
(pop) ; 11
; Joined path conditions
(assert (=
  newRight_V1@15@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; newRight_V1 := N5
; [eval] (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 213 | First:(Second:($t@6@01)) == v_V0@4@01 | live]
; [else-branch: 213 | First:(Second:($t@6@01)) != v_V0@4@01 | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 213 | First:(Second:($t@6@01)) == v_V0@4@01]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))
; [eval] newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
; [then-branch: 214 | res_V0@76@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 214 | res_V0@76@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 12
; [else-branch: 214 | res_V0@76@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(pop) ; 12
; [eval] !(newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  res_V0@76@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 215 | res_V0@76@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 215 | res_V0@76@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 215 | res_V0@76@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] newRight_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 13
(pop) ; 13
; Joined path conditions
; [then-branch: 216 | res_V0@79@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 216 | res_V0@79@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 13
; [else-branch: 216 | res_V0@79@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(pop) ; 13
; [eval] !(newRight_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] newRight_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 13
(pop) ; 13
; Joined path conditions
(push) ; 13
(set-option :timeout 10)
(assert (not (=
  res_V0@79@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [then-branch: 217 | res_V0@79@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 217 | res_V0@79@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 217 | res_V0@79@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [exec]
; var N7: Int
(declare-const N7@82@01 Int)
; [exec]
; var N6: ShStruct3[Ref, Ref, Ref]
(declare-const N6@83@01 ShStruct3<Ref~_Ref~_Ref>)
; [exec]
; var leftMost_V2: Int
(declare-const leftMost_V2@84@01 Int)
; [exec]
; inhale leftMost_V2 == 0
(declare-const $t@85@01 $Snap)
(assert (= $t@85@01 $Snap.unit))
; [eval] leftMost_V2 == 0
(assert (= leftMost_V2@84@01 0))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; leftMost_V2 := 0
; [exec]
; N6, N7 := deleteLeftMost_8a1a376e_PMTree(newRight_V1, v_V0_CN1)
; [eval] !Contains_8a1a376e_PMTree(self_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(self_V0, v_V0)
(set-option :timeout 0)
(push) ; 14
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 15
(pop) ; 15
; Joined path conditions
(push) ; 15
(set-option :timeout 10)
(assert (not (=
  res_V0@79@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [then-branch: 218 | res_V0@79@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 218 | res_V0@79@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 15
; [then-branch: 218 | res_V0@79@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@80@01) res_V0@79@01 v_V0@4@01))
(pop) ; 15
(pop) ; 14
; Joined path conditions
(declare-const res_V0@86@01 ShStruct3<Ref~_Ref~_Ref>)
(declare-const leftMost_V0@87@01 Int)
(declare-const $t@88@01 $Snap)
(assert (= $t@88@01 ($Snap.combine ($Snap.first $t@88@01) ($Snap.second $t@88@01))))
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  res_V0@86@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@86@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [then-branch: 219 | res_V0@86@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 219 | res_V0@86@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 219 | res_V0@86@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    res_V0@86@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(push) ; 15
(set-option :timeout 10)
(assert (not (= res_V0@76@01 res_V0@86@01)))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@88@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@88@01))
    ($Snap.second ($Snap.second $t@88@01)))))
(assert (= ($Snap.first ($Snap.second $t@88@01)) $Snap.unit))
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(set-option :timeout 0)
(push) ; 15
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(set-option :timeout 10)
(assert (not (=
  res_V0@86@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
; [then-branch: 220 | res_V0@86@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 220 | res_V0@86@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 16
; [then-branch: 220 | res_V0@86@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@88@01) res_V0@86@01 v_V0@4@01))
(pop) ; 16
(pop) ; 15
; Joined path conditions
(assert (=>
  (not
    (=
      res_V0@86@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@88@01) res_V0@86@01 v_V0@4@01)))
(assert (not (Contains_8a1a376e_PMTree ($Snap.first $t@88@01) res_V0@86@01 v_V0@4@01)))
(assert (= ($Snap.second ($Snap.second $t@88@01)) $Snap.unit))
; [eval] !(v_V0 == leftMost_V0)
; [eval] v_V0 == leftMost_V0
(assert (not (= v_V0@4@01 leftMost_V0@87@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; (ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := N6
; [eval] (ShStructget2of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= (ShStructget0of3<Ref> self_V0@3@01) (ShStructget2of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [exec]
; leftMost_V2 := N7
; [exec]
; (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ := leftMost_V2
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
; [exec]
; (ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := newLeft_V1
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= (ShStructget2of3<Ref> self_V0@3@01) (ShStructget0of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(tree_8a1a376e_F(self_V0_CN0), write)
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] (ShStructget1of3(self_V0): Ref)
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] !((ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 15
(pop) ; 15
; Joined path conditions
(push) ; 15
(set-option :timeout 10)
(assert (not (=
  res_V0@76@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [then-branch: 221 | res_V0@76@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 221 | res_V0@76@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 15
; [then-branch: 221 | res_V0@76@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] !((ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(set-option :timeout 10)
(assert (not (=
  res_V0@86@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
; [then-branch: 222 | res_V0@86@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 222 | res_V0@86@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 16
; [then-branch: 222 | res_V0@86@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] (ShStructget2of3(self_V0): Ref)
(assert (tree_8a1a376e_F%trigger ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@76@01)
  ($Snap.combine
    ($SortWrappers.IntTo$Snap leftMost_V0@87@01)
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@86@01)
      ($Snap.combine ($Snap.first $t@77@01) ($Snap.first $t@88@01))))) self_V0@3@01))
; [exec]
; res_V0_CN2 := self_V0_CN0
; [exec]
; res_V0_CN2 := res_V0_CN2
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 17
(pop) ; 17
; Joined path conditions
(push) ; 17
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
; [then-branch: 223 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 223 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 17
; [then-branch: 223 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 18
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 19
(pop) ; 19
; Joined path conditions
(push) ; 19
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
; [then-branch: 224 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 224 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 19
; [then-branch: 224 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@76@01)
  ($Snap.combine
    ($SortWrappers.IntTo$Snap leftMost_V0@87@01)
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@86@01)
      ($Snap.combine ($Snap.first $t@77@01) ($Snap.first $t@88@01))))) self_V0@3@01 v_V0@4@01))
(pop) ; 19
(pop) ; 18
; Joined path conditions
(assert (=>
  (not
    (=
      self_V0@3@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@76@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap leftMost_V0@87@01)
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@86@01)
        ($Snap.combine ($Snap.first $t@77@01) ($Snap.first $t@88@01))))) self_V0@3@01 v_V0@4@01)))
(push) ; 18
(assert (not (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@76@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap leftMost_V0@87@01)
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@86@01)
        ($Snap.combine ($Snap.first $t@77@01) ($Snap.first $t@88@01))))) self_V0@3@01 v_V0@4@01))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(assert (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@76@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap leftMost_V0@87@01)
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@86@01)
        ($Snap.combine ($Snap.first $t@77@01) ($Snap.first $t@88@01))))) self_V0@3@01 v_V0@4@01)))
(pop) ; 17
(pop) ; 16
(pop) ; 15
(pop) ; 14
(push) ; 14
; [else-branch: 219 | res_V0@86@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  res_V0@86@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (= ($Snap.first $t@88@01) $Snap.unit))
(assert (=
  ($Snap.second $t@88@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@88@01))
    ($Snap.second ($Snap.second $t@88@01)))))
(assert (= ($Snap.first ($Snap.second $t@88@01)) $Snap.unit))
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 15
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 16
(pop) ; 16
; Joined path conditions
; [then-branch: 225 | res_V0@86@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 225 | res_V0@86@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 16
; [else-branch: 225 | res_V0@86@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@86@01 v_V0@4@01))
(pop) ; 16
(pop) ; 15
; Joined path conditions
(assert (=>
  (=
    res_V0@86@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@86@01 v_V0@4@01)))
(assert (not (Contains_8a1a376e_PMTree $Snap.unit res_V0@86@01 v_V0@4@01)))
(assert (= ($Snap.second ($Snap.second $t@88@01)) $Snap.unit))
; [eval] !(v_V0 == leftMost_V0)
; [eval] v_V0 == leftMost_V0
(assert (not (= v_V0@4@01 leftMost_V0@87@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; (ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := N6
; [eval] (ShStructget2of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= (ShStructget0of3<Ref> self_V0@3@01) (ShStructget2of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [exec]
; leftMost_V2 := N7
; [exec]
; (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ := leftMost_V2
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
; [exec]
; (ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := newLeft_V1
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 15
(set-option :timeout 10)
(assert (not (= (ShStructget2of3<Ref> self_V0@3@01) (ShStructget0of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(tree_8a1a376e_F(self_V0_CN0), write)
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] (ShStructget1of3(self_V0): Ref)
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] !((ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 15
(pop) ; 15
; Joined path conditions
(push) ; 15
(set-option :timeout 10)
(assert (not (=
  res_V0@76@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [then-branch: 226 | res_V0@76@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 226 | res_V0@76@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 15
; [then-branch: 226 | res_V0@76@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] !((ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 16
(pop) ; 16
; Joined path conditions
; [then-branch: 227 | res_V0@86@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 227 | res_V0@86@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 16
; [else-branch: 227 | res_V0@86@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (tree_8a1a376e_F%trigger ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@76@01)
  ($Snap.combine
    ($SortWrappers.IntTo$Snap leftMost_V0@87@01)
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@86@01)
      ($Snap.combine ($Snap.first $t@77@01) $Snap.unit)))) self_V0@3@01))
; [exec]
; res_V0_CN2 := self_V0_CN0
; [exec]
; res_V0_CN2 := res_V0_CN2
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 17
(pop) ; 17
; Joined path conditions
(push) ; 17
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 17
; 0.00s
; (get-info :all-statistics)
; [then-branch: 228 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 228 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 17
; [then-branch: 228 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 18
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 19
(pop) ; 19
; Joined path conditions
(push) ; 19
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 19
; 0.00s
; (get-info :all-statistics)
; [then-branch: 229 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 229 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 19
; [then-branch: 229 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@76@01)
  ($Snap.combine
    ($SortWrappers.IntTo$Snap leftMost_V0@87@01)
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@86@01)
      ($Snap.combine ($Snap.first $t@77@01) $Snap.unit)))) self_V0@3@01 v_V0@4@01))
(pop) ; 19
(pop) ; 18
; Joined path conditions
(assert (=>
  (not
    (=
      self_V0@3@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@76@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap leftMost_V0@87@01)
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@86@01)
        ($Snap.combine ($Snap.first $t@77@01) $Snap.unit)))) self_V0@3@01 v_V0@4@01)))
(push) ; 18
(assert (not (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@76@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap leftMost_V0@87@01)
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@86@01)
        ($Snap.combine ($Snap.first $t@77@01) $Snap.unit)))) self_V0@3@01 v_V0@4@01))))
(check-sat)
; unsat
(pop) ; 18
; 0.00s
; (get-info :all-statistics)
(assert (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@76@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap leftMost_V0@87@01)
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@86@01)
        ($Snap.combine ($Snap.first $t@77@01) $Snap.unit)))) self_V0@3@01 v_V0@4@01)))
(pop) ; 17
(pop) ; 16
(pop) ; 15
(pop) ; 14
(pop) ; 13
(pop) ; 12
(pop) ; 11
(push) ; 11
; [else-branch: 213 | First:(Second:($t@6@01)) != v_V0@4@01]
(assert (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(pop) ; 11
; [eval] !((ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1)
; [eval] (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 230 | First:(Second:($t@6@01)) != v_V0@4@01 | live]
; [else-branch: 230 | First:(Second:($t@6@01)) == v_V0@4@01 | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 230 | First:(Second:($t@6@01)) != v_V0@4@01]
(assert (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
; [exec]
; (ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := newLeft_V1
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
(push) ; 12
(set-option :timeout 10)
(assert (not (= (ShStructget2of3<Ref> self_V0@3@01) (ShStructget0of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; (ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := newRight_V1
; [eval] (ShStructget2of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= (ShStructget0of3<Ref> self_V0@3@01) (ShStructget2of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(tree_8a1a376e_F(self_V0_CN0), write)
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] (ShStructget1of3(self_V0): Ref)
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] !((ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  res_V0@76@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 231 | res_V0@76@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 231 | res_V0@76@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 231 | res_V0@76@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] !((ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 13
(pop) ; 13
; Joined path conditions
(push) ; 13
(set-option :timeout 10)
(assert (not (=
  res_V0@79@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [then-branch: 232 | res_V0@79@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 232 | res_V0@79@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 232 | res_V0@79@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] (ShStructget2of3(self_V0): Ref)
(assert (tree_8a1a376e_F%trigger ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@76@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@79@01)
      ($Snap.combine ($Snap.first $t@77@01) ($Snap.first $t@80@01))))) self_V0@3@01))
; [exec]
; res_V0_CN2 := self_V0_CN0
; [exec]
; res_V0_CN2 := res_V0_CN2
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [then-branch: 233 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 233 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 233 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 15
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
; [then-branch: 234 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 234 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 16
; [then-branch: 234 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@76@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@79@01)
      ($Snap.combine ($Snap.first $t@77@01) ($Snap.first $t@80@01))))) self_V0@3@01 v_V0@4@01))
(pop) ; 16
(pop) ; 15
; Joined path conditions
(assert (=>
  (not
    (=
      self_V0@3@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@76@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@79@01)
        ($Snap.combine ($Snap.first $t@77@01) ($Snap.first $t@80@01))))) self_V0@3@01 v_V0@4@01)))
(push) ; 15
(assert (not (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@76@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@79@01)
        ($Snap.combine ($Snap.first $t@77@01) ($Snap.first $t@80@01))))) self_V0@3@01 v_V0@4@01))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(assert (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@76@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@79@01)
        ($Snap.combine ($Snap.first $t@77@01) ($Snap.first $t@80@01))))) self_V0@3@01 v_V0@4@01)))
(pop) ; 14
(pop) ; 13
(pop) ; 12
(pop) ; 11
(push) ; 11
; [else-branch: 230 | First:(Second:($t@6@01)) == v_V0@4@01]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))
(pop) ; 11
(pop) ; 10
(push) ; 10
; [else-branch: 211 | res_V0@79@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  res_V0@79@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (= ($Snap.first $t@80@01) $Snap.unit))
(assert (= ($Snap.second $t@80@01) $Snap.unit))
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 11
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
; [then-branch: 235 | res_V0@79@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 235 | res_V0@79@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 12
; [else-branch: 235 | res_V0@79@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@79@01 v_V0@4@01))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (=
    res_V0@79@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@79@01 v_V0@4@01)))
(assert (not (Contains_8a1a376e_PMTree $Snap.unit res_V0@79@01 v_V0@4@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale newRight_V1 ==
;   shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(declare-const $t@89@01 $Snap)
(assert (= $t@89@01 $Snap.unit))
; [eval] newRight_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 11
(pop) ; 11
; Joined path conditions
(assert (=
  newRight_V1@15@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; newRight_V1 := N5
; [eval] (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 236 | First:(Second:($t@6@01)) == v_V0@4@01 | live]
; [else-branch: 236 | First:(Second:($t@6@01)) != v_V0@4@01 | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 236 | First:(Second:($t@6@01)) == v_V0@4@01]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))
; [eval] newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
; [then-branch: 237 | res_V0@76@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 237 | res_V0@76@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 12
; [else-branch: 237 | res_V0@76@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(pop) ; 12
; [eval] !(newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  res_V0@76@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 238 | res_V0@76@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 238 | res_V0@76@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 238 | res_V0@76@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] newRight_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 13
(pop) ; 13
; Joined path conditions
(push) ; 13
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@79@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [then-branch: 239 | res_V0@79@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 239 | res_V0@79@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 239 | res_V0@79@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [exec]
; res_V0_CN2 := newLeft_V1
; [exec]
; res_V0_CN2 := res_V0_CN2
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  res_V0@76@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [then-branch: 240 | res_V0@76@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 240 | res_V0@76@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 240 | res_V0@76@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 15
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(set-option :timeout 10)
(assert (not (=
  res_V0@76@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 16
; 0.01s
; (get-info :all-statistics)
; [then-branch: 241 | res_V0@76@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 241 | res_V0@76@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 16
; [then-branch: 241 | res_V0@76@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@77@01) res_V0@76@01 v_V0@4@01))
(pop) ; 16
(pop) ; 15
; Joined path conditions
(pop) ; 14
(pop) ; 13
; [eval] !(newRight_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] newRight_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 13
(pop) ; 13
; Joined path conditions
; [then-branch: 242 | res_V0@79@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 242 | res_V0@79@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 13
; [else-branch: 242 | res_V0@79@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(pop) ; 13
(pop) ; 12
(pop) ; 11
(push) ; 11
; [else-branch: 236 | First:(Second:($t@6@01)) != v_V0@4@01]
(assert (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(pop) ; 11
; [eval] !((ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1)
; [eval] (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 243 | First:(Second:($t@6@01)) != v_V0@4@01 | live]
; [else-branch: 243 | First:(Second:($t@6@01)) == v_V0@4@01 | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 243 | First:(Second:($t@6@01)) != v_V0@4@01]
(assert (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
; [exec]
; (ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := newLeft_V1
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
(push) ; 12
(set-option :timeout 10)
(assert (not (= (ShStructget2of3<Ref> self_V0@3@01) (ShStructget0of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; (ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := newRight_V1
; [eval] (ShStructget2of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= (ShStructget0of3<Ref> self_V0@3@01) (ShStructget2of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(tree_8a1a376e_F(self_V0_CN0), write)
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] (ShStructget1of3(self_V0): Ref)
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] !((ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  res_V0@76@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 244 | res_V0@76@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 244 | res_V0@76@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 244 | res_V0@76@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] !((ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 13
(pop) ; 13
; Joined path conditions
; [then-branch: 245 | res_V0@79@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 245 | res_V0@79@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 13
; [else-branch: 245 | res_V0@79@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (tree_8a1a376e_F%trigger ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@76@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@79@01)
      ($Snap.combine ($Snap.first $t@77@01) $Snap.unit)))) self_V0@3@01))
; [exec]
; res_V0_CN2 := self_V0_CN0
; [exec]
; res_V0_CN2 := res_V0_CN2
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [then-branch: 246 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 246 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 246 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 15
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
; [then-branch: 247 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 247 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 16
; [then-branch: 247 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@76@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@79@01)
      ($Snap.combine ($Snap.first $t@77@01) $Snap.unit)))) self_V0@3@01 v_V0@4@01))
(pop) ; 16
(pop) ; 15
; Joined path conditions
(assert (=>
  (not
    (=
      self_V0@3@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@76@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@79@01)
        ($Snap.combine ($Snap.first $t@77@01) $Snap.unit)))) self_V0@3@01 v_V0@4@01)))
(push) ; 15
(assert (not (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@76@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@79@01)
        ($Snap.combine ($Snap.first $t@77@01) $Snap.unit)))) self_V0@3@01 v_V0@4@01))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(assert (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@76@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@79@01)
        ($Snap.combine ($Snap.first $t@77@01) $Snap.unit)))) self_V0@3@01 v_V0@4@01)))
(pop) ; 14
(pop) ; 13
(pop) ; 12
(pop) ; 11
(push) ; 11
; [else-branch: 243 | First:(Second:($t@6@01)) == v_V0@4@01]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))
(pop) ; 11
(pop) ; 10
(pop) ; 9
(pop) ; 8
(push) ; 8
; [else-branch: 208 | res_V0@76@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  res_V0@76@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (= ($Snap.first $t@77@01) $Snap.unit))
(assert (= ($Snap.second $t@77@01) $Snap.unit))
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 9
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 10
(pop) ; 10
; Joined path conditions
; [then-branch: 248 | res_V0@76@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 248 | res_V0@76@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 10
; [else-branch: 248 | res_V0@76@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@76@01 v_V0@4@01))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (=
    res_V0@76@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@76@01 v_V0@4@01)))
(assert (not (Contains_8a1a376e_PMTree $Snap.unit res_V0@76@01 v_V0@4@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale newLeft_V1 ==
;   shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(declare-const $t@90@01 $Snap)
(assert (= $t@90@01 $Snap.unit))
; [eval] newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 9
(pop) ; 9
; Joined path conditions
(assert (=
  newLeft_V1@17@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; newLeft_V1 := N4
; [exec]
; N5 := DeleteAll_8a1a376e_PMTree((ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$,
;   v_V0_CN1)
; [eval] (ShStructget2of3(self_V0_CN0): Ref)
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 9
(pop) ; 9
; Joined path conditions
; [then-branch: 249 | First:(Second:(Second:($t@6@01))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 249 | First:(Second:(Second:($t@6@01))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 9
; [else-branch: 249 | First:(Second:(Second:($t@6@01))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(declare-const res_V0@91@01 ShStruct3<Ref~_Ref~_Ref>)
(declare-const $t@92@01 $Snap)
(assert (= $t@92@01 ($Snap.combine ($Snap.first $t@92@01) ($Snap.second $t@92@01))))
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  res_V0@91@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@91@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 250 | res_V0@91@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 250 | res_V0@91@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 250 | res_V0@91@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    res_V0@91@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(assert (= ($Snap.second $t@92@01) $Snap.unit))
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 11
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  res_V0@91@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 251 | res_V0@91@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 251 | res_V0@91@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 251 | res_V0@91@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@92@01) res_V0@91@01 v_V0@4@01))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (not
    (=
      res_V0@91@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@92@01) res_V0@91@01 v_V0@4@01)))
(assert (not (Contains_8a1a376e_PMTree ($Snap.first $t@92@01) res_V0@91@01 v_V0@4@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale newRight_V1 ==
;   shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(declare-const $t@93@01 $Snap)
(assert (= $t@93@01 $Snap.unit))
; [eval] newRight_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 11
(pop) ; 11
; Joined path conditions
(assert (=
  newRight_V1@15@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; newRight_V1 := N5
; [eval] (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 252 | First:(Second:($t@6@01)) == v_V0@4@01 | live]
; [else-branch: 252 | First:(Second:($t@6@01)) != v_V0@4@01 | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 252 | First:(Second:($t@6@01)) == v_V0@4@01]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))
; [eval] newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@76@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 253 | res_V0@76@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 253 | res_V0@76@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 253 | res_V0@76@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [exec]
; res_V0_CN2 := newRight_V1
; [exec]
; res_V0_CN2 := res_V0_CN2
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 13
(pop) ; 13
; Joined path conditions
(push) ; 13
(set-option :timeout 10)
(assert (not (=
  res_V0@91@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [then-branch: 254 | res_V0@91@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 254 | res_V0@91@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 254 | res_V0@91@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 14
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 15
(pop) ; 15
; Joined path conditions
(push) ; 15
(set-option :timeout 10)
(assert (not (=
  res_V0@91@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
; [then-branch: 255 | res_V0@91@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 255 | res_V0@91@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 15
; [then-branch: 255 | res_V0@91@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@92@01) res_V0@91@01 v_V0@4@01))
(pop) ; 15
(pop) ; 14
; Joined path conditions
(pop) ; 13
(pop) ; 12
; [eval] !(newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
; [then-branch: 256 | res_V0@76@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 256 | res_V0@76@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 12
; [else-branch: 256 | res_V0@76@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(pop) ; 12
(pop) ; 11
(push) ; 11
; [else-branch: 252 | First:(Second:($t@6@01)) != v_V0@4@01]
(assert (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(pop) ; 11
; [eval] !((ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1)
; [eval] (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 257 | First:(Second:($t@6@01)) != v_V0@4@01 | live]
; [else-branch: 257 | First:(Second:($t@6@01)) == v_V0@4@01 | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 257 | First:(Second:($t@6@01)) != v_V0@4@01]
(assert (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
; [exec]
; (ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := newLeft_V1
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
(push) ; 12
(set-option :timeout 10)
(assert (not (= (ShStructget2of3<Ref> self_V0@3@01) (ShStructget0of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; (ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := newRight_V1
; [eval] (ShStructget2of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= (ShStructget0of3<Ref> self_V0@3@01) (ShStructget2of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(tree_8a1a376e_F(self_V0_CN0), write)
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] (ShStructget1of3(self_V0): Ref)
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] !((ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 12
(pop) ; 12
; Joined path conditions
; [then-branch: 258 | res_V0@76@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 258 | res_V0@76@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 12
; [else-branch: 258 | res_V0@76@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !((ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 13
(pop) ; 13
; Joined path conditions
(push) ; 13
(set-option :timeout 10)
(assert (not (=
  res_V0@91@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
; [then-branch: 259 | res_V0@91@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 259 | res_V0@91@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 259 | res_V0@91@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] (ShStructget2of3(self_V0): Ref)
(assert (tree_8a1a376e_F%trigger ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@76@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@91@01)
      ($Snap.combine $Snap.unit ($Snap.first $t@92@01))))) self_V0@3@01))
; [exec]
; res_V0_CN2 := self_V0_CN0
; [exec]
; res_V0_CN2 := res_V0_CN2
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [then-branch: 260 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 260 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 260 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 15
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
; [then-branch: 261 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 261 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 16
; [then-branch: 261 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@76@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@91@01)
      ($Snap.combine $Snap.unit ($Snap.first $t@92@01))))) self_V0@3@01 v_V0@4@01))
(pop) ; 16
(pop) ; 15
; Joined path conditions
(assert (=>
  (not
    (=
      self_V0@3@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@76@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@91@01)
        ($Snap.combine $Snap.unit ($Snap.first $t@92@01))))) self_V0@3@01 v_V0@4@01)))
(push) ; 15
(assert (not (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@76@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@91@01)
        ($Snap.combine $Snap.unit ($Snap.first $t@92@01))))) self_V0@3@01 v_V0@4@01))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(assert (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@76@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@91@01)
        ($Snap.combine $Snap.unit ($Snap.first $t@92@01))))) self_V0@3@01 v_V0@4@01)))
(pop) ; 14
(pop) ; 13
(pop) ; 12
(pop) ; 11
(push) ; 11
; [else-branch: 257 | First:(Second:($t@6@01)) == v_V0@4@01]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))
(pop) ; 11
(pop) ; 10
(push) ; 10
; [else-branch: 250 | res_V0@91@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  res_V0@91@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (= ($Snap.first $t@92@01) $Snap.unit))
(assert (= ($Snap.second $t@92@01) $Snap.unit))
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 11
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
; [then-branch: 262 | res_V0@91@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 262 | res_V0@91@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 12
; [else-branch: 262 | res_V0@91@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@91@01 v_V0@4@01))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (=
    res_V0@91@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@91@01 v_V0@4@01)))
(assert (not (Contains_8a1a376e_PMTree $Snap.unit res_V0@91@01 v_V0@4@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale newRight_V1 ==
;   shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(declare-const $t@94@01 $Snap)
(assert (= $t@94@01 $Snap.unit))
; [eval] newRight_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 11
(pop) ; 11
; Joined path conditions
(assert (=
  newRight_V1@15@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; newRight_V1 := N5
; [eval] (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 263 | First:(Second:($t@6@01)) == v_V0@4@01 | live]
; [else-branch: 263 | First:(Second:($t@6@01)) != v_V0@4@01 | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 263 | First:(Second:($t@6@01)) == v_V0@4@01]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))
; [eval] newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@76@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 264 | res_V0@76@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 264 | res_V0@76@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 264 | res_V0@76@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [exec]
; res_V0_CN2 := newRight_V1
; [exec]
; res_V0_CN2 := res_V0_CN2
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 13
(pop) ; 13
; Joined path conditions
; [then-branch: 265 | res_V0@91@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 265 | res_V0@91@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 13
; [else-branch: 265 | res_V0@91@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 14
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 15
(pop) ; 15
; Joined path conditions
; [then-branch: 266 | res_V0@91@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 266 | res_V0@91@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 15
; [else-branch: 266 | res_V0@91@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@91@01 v_V0@4@01))
(pop) ; 15
(pop) ; 14
; Joined path conditions
(pop) ; 13
(pop) ; 12
; [eval] !(newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] newLeft_V1 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
; [then-branch: 267 | res_V0@76@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 267 | res_V0@76@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 12
; [else-branch: 267 | res_V0@76@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(pop) ; 12
(pop) ; 11
(push) ; 11
; [else-branch: 263 | First:(Second:($t@6@01)) != v_V0@4@01]
(assert (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(pop) ; 11
; [eval] !((ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1)
; [eval] (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ == v_V0_CN1
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 268 | First:(Second:($t@6@01)) != v_V0@4@01 | live]
; [else-branch: 268 | First:(Second:($t@6@01)) == v_V0@4@01 | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 268 | First:(Second:($t@6@01)) != v_V0@4@01]
(assert (not
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01)))
; [exec]
; (ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := newLeft_V1
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
(push) ; 12
(set-option :timeout 10)
(assert (not (= (ShStructget2of3<Ref> self_V0@3@01) (ShStructget0of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; (ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := newRight_V1
; [eval] (ShStructget2of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= (ShStructget0of3<Ref> self_V0@3@01) (ShStructget2of3<Ref> self_V0@3@01))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(tree_8a1a376e_F(self_V0_CN0), write)
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] (ShStructget1of3(self_V0): Ref)
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] !((ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 12
(pop) ; 12
; Joined path conditions
; [then-branch: 269 | res_V0@76@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 269 | res_V0@76@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 12
; [else-branch: 269 | res_V0@76@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !((ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 13
(pop) ; 13
; Joined path conditions
; [then-branch: 270 | res_V0@91@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 270 | res_V0@91@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 13
; [else-branch: 270 | res_V0@91@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (tree_8a1a376e_F%trigger ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@76@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@91@01)
      ($Snap.combine $Snap.unit $Snap.unit)))) self_V0@3@01))
; [exec]
; res_V0_CN2 := self_V0_CN0
; [exec]
; res_V0_CN2 := res_V0_CN2
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [then-branch: 271 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 271 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 271 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 15
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(set-option :timeout 10)
(assert (not (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 16
; 0.00s
; (get-info :all-statistics)
; [then-branch: 272 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 272 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 16
; [then-branch: 272 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@76@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@91@01)
      ($Snap.combine $Snap.unit $Snap.unit)))) self_V0@3@01 v_V0@4@01))
(pop) ; 16
(pop) ; 15
; Joined path conditions
(assert (=>
  (not
    (=
      self_V0@3@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@76@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@91@01)
        ($Snap.combine $Snap.unit $Snap.unit)))) self_V0@3@01 v_V0@4@01)))
(push) ; 15
(assert (not (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@76@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@91@01)
        ($Snap.combine $Snap.unit $Snap.unit)))) self_V0@3@01 v_V0@4@01))))
(check-sat)
; unsat
(pop) ; 15
; 0.00s
; (get-info :all-statistics)
(assert (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@76@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@6@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@91@01)
        ($Snap.combine $Snap.unit $Snap.unit)))) self_V0@3@01 v_V0@4@01)))
(pop) ; 14
(pop) ; 13
(pop) ; 12
(pop) ; 11
(push) ; 11
; [else-branch: 268 | First:(Second:($t@6@01)) == v_V0@4@01]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01))) v_V0@4@01))
(pop) ; 11
(pop) ; 10
(pop) ; 9
(pop) ; 8
(pop) ; 7
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(push) ; 2
; [else-branch: 0 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  self_V0@3@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(declare-const $t@95@01 $Snap)
(assert (= $t@95@01 $Snap.unit))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(declare-const $t@96@01 $Snap)
(assert (= $t@96@01 ($Snap.combine ($Snap.first $t@96@01) ($Snap.second $t@96@01))))
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  res_V0@5@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@5@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 273 | res_V0@5@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 273 | res_V0@5@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 273 | res_V0@5@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    res_V0@5@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(assert (= ($Snap.second $t@96@01) $Snap.unit))
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 5
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  res_V0@5@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 274 | res_V0@5@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 274 | res_V0@5@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 274 | res_V0@5@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@96@01) res_V0@5@01 v_V0@4@01))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (not
    (=
      res_V0@5@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@96@01) res_V0@5@01 v_V0@4@01)))
(assert (not (Contains_8a1a376e_PMTree ($Snap.first $t@96@01) res_V0@5@01 v_V0@4@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 273 | res_V0@5@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  res_V0@5@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (= ($Snap.first $t@96@01) $Snap.unit))
(assert (= ($Snap.second $t@96@01) $Snap.unit))
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 5
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 6
(pop) ; 6
; Joined path conditions
; [then-branch: 275 | res_V0@5@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 275 | res_V0@5@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 6
; [else-branch: 275 | res_V0@5@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@5@01 v_V0@4@01))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (=
    res_V0@5@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@5@01 v_V0@4@01)))
(assert (not (Contains_8a1a376e_PMTree $Snap.unit res_V0@5@01 v_V0@4@01)))
(pop) ; 4
(pop) ; 3
(push) ; 3
; [exec]
; var res_V0_CN2: ShStruct3[Ref, Ref, Ref]
(declare-const res_V0_CN2@97@01 ShStruct3<Ref~_Ref~_Ref>)
; [exec]
; var v_V0_CN1: Int
(declare-const v_V0_CN1@98@01 Int)
; [exec]
; var self_V0_CN0: ShStruct3[Ref, Ref, Ref]
(declare-const self_V0_CN0@99@01 ShStruct3<Ref~_Ref~_Ref>)
; [exec]
; inhale res_V0 ==
;   shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(declare-const $t@100@01 $Snap)
(assert (= $t@100@01 $Snap.unit))
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 4
(pop) ; 4
; Joined path conditions
(assert (=
  res_V0@5@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale self_V0_CN0 ==
;   shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(declare-const $t@101@01 $Snap)
(assert (= $t@101@01 $Snap.unit))
; [eval] self_V0_CN0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 4
(pop) ; 4
; Joined path conditions
(assert (=
  self_V0_CN0@99@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale v_V0_CN1 == 0
(declare-const $t@102@01 $Snap)
(assert (= $t@102@01 $Snap.unit))
; [eval] v_V0_CN1 == 0
(assert (= v_V0_CN1@98@01 0))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale res_V0_CN2 ==
;   shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(declare-const $t@103@01 $Snap)
(assert (= $t@103@01 $Snap.unit))
; [eval] res_V0_CN2 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 4
(pop) ; 4
; Joined path conditions
(assert (=
  res_V0_CN2@97@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; self_V0_CN0 := self_V0
; [exec]
; v_V0_CN1 := v_V0
; [eval] self_V0_CN0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    self_V0@3@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 276 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 276 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 276 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [exec]
; res_V0_CN2 := shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 5
(pop) ; 5
; Joined path conditions
(declare-const res_V0_CN2@104@01 ShStruct3<Ref~_Ref~_Ref>)
(assert (=
  res_V0_CN2@104@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
; [exec]
; res_V0_CN2 := res_V0_CN2
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 5
(pop) ; 5
; Joined path conditions
; [then-branch: 277 | res_V0_CN2@104@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 277 | res_V0_CN2@104@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 5
; [else-branch: 277 | res_V0_CN2@104@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 6
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 7
(pop) ; 7
; Joined path conditions
; [then-branch: 278 | res_V0_CN2@104@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 278 | res_V0_CN2@104@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 7
; [else-branch: 278 | res_V0_CN2@104@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0_CN2@104@01 v_V0@4@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (=
    res_V0_CN2@104@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0_CN2@104@01 v_V0@4@01)))
(push) ; 6
(assert (not (not (Contains_8a1a376e_PMTree $Snap.unit res_V0_CN2@104@01 v_V0@4@01))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (not (Contains_8a1a376e_PMTree $Snap.unit res_V0_CN2@104@01 v_V0@4@01)))
(pop) ; 5
(pop) ; 4
; [eval] !(self_V0_CN0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0_CN0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 4
(pop) ; 4
; Joined path conditions
; [then-branch: 279 | self_V0@3@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 279 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 4
; [else-branch: 279 | self_V0@3@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- Insert_8a1a376e_PMTree ----------
(declare-const self_V0@105@01 ShStruct3<Ref~_Ref~_Ref>)
(declare-const v_V0@106@01 Int)
(declare-const res_V0@107@01 ShStruct3<Ref~_Ref~_Ref>)
(declare-const self_V0@108@01 ShStruct3<Ref~_Ref~_Ref>)
(declare-const v_V0@109@01 Int)
(declare-const res_V0@110@01 ShStruct3<Ref~_Ref~_Ref>)
(push) ; 1
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 2
(assert (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$%precondition $Snap.unit))
(pop) ; 2
; Joined path conditions
(assert (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$%precondition $Snap.unit))
(push) ; 2
(set-option :timeout 10)
(assert (not (=
  self_V0@108@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (not
  (=
    self_V0@108@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
; [then-branch: 280 | self_V0@108@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 280 | self_V0@108@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 280 | self_V0@108@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    self_V0@108@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(declare-const $t@111@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(declare-const $t@112@01 $Snap)
(assert (= $t@112@01 ($Snap.combine ($Snap.first $t@112@01) ($Snap.second $t@112@01))))
(assert (= ($Snap.second $t@112@01) $Snap.unit))
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 4
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  res_V0@110@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@110@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 281 | res_V0@110@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 281 | res_V0@110@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 281 | res_V0@110@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    res_V0@110@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@112@01) res_V0@110@01 v_V0@109@01))
(pop) ; 5
(push) ; 5
; [else-branch: 281 | res_V0@110@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  res_V0@110@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@110@01 v_V0@109@01))
(pop) ; 5
(pop) ; 4
(declare-fun joined_Contains_8a1a376e_PMTree@113@01 (ShStruct3<Ref~_Ref~_Ref> Int) Bool)
(assert (=>
  (not
    (=
      res_V0@110@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (=
    (joined_Contains_8a1a376e_PMTree@113@01 res_V0@110@01 v_V0@109@01)
    (Contains_8a1a376e_PMTree ($Snap.first $t@112@01) res_V0@110@01 v_V0@109@01))))
(assert (=>
  (=
    res_V0@110@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (=
    (joined_Contains_8a1a376e_PMTree@113@01 res_V0@110@01 v_V0@109@01)
    (Contains_8a1a376e_PMTree $Snap.unit res_V0@110@01 v_V0@109@01))))
; Joined path conditions
(assert (=>
  (not
    (=
      res_V0@110@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (and
    (not
      (=
        res_V0@110@01
        (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
    (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@112@01) res_V0@110@01 v_V0@109@01))))
; Joined path conditions
(assert (=>
  (=
    res_V0@110@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (and
    (=
      res_V0@110@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
    (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@110@01 v_V0@109@01))))
(assert (or
  (=
    res_V0@110@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (not
    (=
      res_V0@110@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(assert (joined_Contains_8a1a376e_PMTree@113@01 res_V0@110@01 v_V0@109@01))
(pop) ; 3
(push) ; 3
; [exec]
; var res_V0_CN2: ShStruct3[Ref, Ref, Ref]
(declare-const res_V0_CN2@114@01 ShStruct3<Ref~_Ref~_Ref>)
; [exec]
; var v_V0_CN1: Int
(declare-const v_V0_CN1@115@01 Int)
; [exec]
; var self_V0_CN0: ShStruct3[Ref, Ref, Ref]
(declare-const self_V0_CN0@116@01 ShStruct3<Ref~_Ref~_Ref>)
; [exec]
; inhale res_V0 ==
;   shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(declare-const $t@117@01 $Snap)
(assert (= $t@117@01 $Snap.unit))
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 4
(pop) ; 4
; Joined path conditions
(assert (=
  res_V0@110@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale self_V0_CN0 ==
;   shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(declare-const $t@118@01 $Snap)
(assert (= $t@118@01 $Snap.unit))
; [eval] self_V0_CN0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 4
(pop) ; 4
; Joined path conditions
(assert (=
  self_V0_CN0@116@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale v_V0_CN1 == 0
(declare-const $t@119@01 $Snap)
(assert (= $t@119@01 $Snap.unit))
; [eval] v_V0_CN1 == 0
(assert (= v_V0_CN1@115@01 0))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale res_V0_CN2 ==
;   shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(declare-const $t@120@01 $Snap)
(assert (= $t@120@01 $Snap.unit))
; [eval] res_V0_CN2 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 4
(pop) ; 4
; Joined path conditions
(assert (=
  res_V0_CN2@114@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; self_V0_CN0 := self_V0
; [exec]
; v_V0_CN1 := v_V0
; [eval] self_V0_CN0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 4
(pop) ; 4
; Joined path conditions
; [then-branch: 282 | self_V0@108@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 282 | self_V0@108@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 4
; [else-branch: 282 | self_V0@108@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(pop) ; 4
; [eval] !(self_V0_CN0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0_CN0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  self_V0@108@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 283 | self_V0@108@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 283 | self_V0@108@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 283 | self_V0@108@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [exec]
; unfold acc(tree_8a1a376e_F(self_V0_CN0), write)
(assert (= $t@111@01 ($Snap.combine ($Snap.first $t@111@01) ($Snap.second $t@111@01))))
; [eval] (ShStructget0of3(self_V0): Ref)
(assert (not (= (ShStructget0of3<Ref> self_V0@108@01) $Ref.null)))
(assert (=
  ($Snap.second $t@111@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@111@01))
    ($Snap.second ($Snap.second $t@111@01)))))
; [eval] (ShStructget1of3(self_V0): Ref)
(assert (not (= (ShStructget1of3<Ref> self_V0@108@01) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second $t@111@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@111@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@111@01))))))
; [eval] (ShStructget2of3(self_V0): Ref)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (ShStructget0of3<Ref> self_V0@108@01) (ShStructget2of3<Ref> self_V0@108@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= (ShStructget2of3<Ref> self_V0@108@01) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@111@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@111@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@111@01)))))))
; [eval] !((ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first $t@111@01))
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first $t@111@01))
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 284 | First:($t@111@01) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 284 | First:($t@111@01) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 284 | First:($t@111@01) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first $t@111@01))
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] !((ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second $t@111@01))))
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second $t@111@01))))
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 285 | First:(Second:(Second:($t@111@01))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 285 | First:(Second:(Second:($t@111@01))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 285 | First:(Second:(Second:($t@111@01))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second $t@111@01))))
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
; [eval] (ShStructget2of3(self_V0): Ref)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first $t@111@01))
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second $t@111@01)))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (tree_8a1a376e_F%trigger $t@111@01 self_V0@108@01))
; [eval] ((ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ + v_V0_CN1) % 2 == 0
; [eval] ((ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ + v_V0_CN1) % 2
; [eval] (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ + v_V0_CN1
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    (mod
      (+
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@111@01)))
        v_V0@109@01)
      2)
    0))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (mod
    (+
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@111@01)))
      v_V0@109@01)
    2)
  0)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 286 | First:(Second:($t@111@01)) + v_V0@109@01 % 2 == 0 | live]
; [else-branch: 286 | First:(Second:($t@111@01)) + v_V0@109@01 % 2 != 0 | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 286 | First:(Second:($t@111@01)) + v_V0@109@01 % 2 == 0]
(assert (=
  (mod
    (+
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@111@01)))
      v_V0@109@01)
    2)
  0))
; [exec]
; var N5: ShStruct3[Ref, Ref, Ref]
(declare-const N5@121@01 ShStruct3<Ref~_Ref~_Ref>)
; [exec]
; N5 := Insert_8a1a376e_PMTree((ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$,
;   v_V0_CN1)
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 8
(pop) ; 8
; Joined path conditions
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first $t@111@01))
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 287 | First:($t@111@01) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 287 | First:($t@111@01) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 287 | First:($t@111@01) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(declare-const res_V0@122@01 ShStruct3<Ref~_Ref~_Ref>)
(declare-const $t@123@01 $Snap)
(assert (= $t@123@01 ($Snap.combine ($Snap.first $t@123@01) ($Snap.second $t@123@01))))
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second $t@111@01))))
  res_V0@122@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@123@01) $Snap.unit))
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(set-option :timeout 0)
(push) ; 9
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  res_V0@122@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@122@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 288 | res_V0@122@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 288 | res_V0@122@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 288 | res_V0@122@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    res_V0@122@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@123@01) res_V0@122@01 v_V0@109@01))
(pop) ; 10
(push) ; 10
; [else-branch: 288 | res_V0@122@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  res_V0@122@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@122@01 v_V0@109@01))
(pop) ; 10
(pop) ; 9
(declare-fun joined_Contains_8a1a376e_PMTree@124@01 (ShStruct3<Ref~_Ref~_Ref> Int) Bool)
(assert (=>
  (not
    (=
      res_V0@122@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (=
    (joined_Contains_8a1a376e_PMTree@124@01 res_V0@122@01 v_V0@109@01)
    (Contains_8a1a376e_PMTree ($Snap.first $t@123@01) res_V0@122@01 v_V0@109@01))))
(assert (=>
  (=
    res_V0@122@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (=
    (joined_Contains_8a1a376e_PMTree@124@01 res_V0@122@01 v_V0@109@01)
    (Contains_8a1a376e_PMTree $Snap.unit res_V0@122@01 v_V0@109@01))))
; Joined path conditions
(assert (=>
  (not
    (=
      res_V0@122@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (and
    (not
      (=
        res_V0@122@01
        (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
    (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@123@01) res_V0@122@01 v_V0@109@01))))
; Joined path conditions
(assert (=>
  (=
    res_V0@122@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (and
    (=
      res_V0@122@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
    (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@122@01 v_V0@109@01))))
(assert (or
  (=
    res_V0@122@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (not
    (=
      res_V0@122@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(assert (joined_Contains_8a1a376e_PMTree@124@01 res_V0@122@01 v_V0@109@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; (ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := N5
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= (ShStructget2of3<Ref> self_V0@108@01) (ShStructget0of3<Ref> self_V0@108@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; res_V0_CN2 := self_V0_CN0
; [exec]
; fold acc(tree_8a1a376e_F(res_V0_CN2), write)
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] (ShStructget1of3(self_V0): Ref)
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] !((ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  res_V0@122@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@122@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 289 | res_V0@122@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 289 | res_V0@122@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 289 | res_V0@122@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    res_V0@122@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] !((ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second $t@111@01))))
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 290 | First:(Second:(Second:($t@111@01))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 290 | First:(Second:(Second:($t@111@01))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 290 | First:(Second:(Second:($t@111@01))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] (ShStructget2of3(self_V0): Ref)
(assert (tree_8a1a376e_F%trigger ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@122@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@111@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@111@01)))
      ($Snap.combine
        ($Snap.first $t@123@01)
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@111@01)))))))) self_V0@108@01))
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 11
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  self_V0@108@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 291 | self_V0@108@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 291 | self_V0@108@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 291 | self_V0@108@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@122@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@111@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@111@01)))
      ($Snap.combine
        ($Snap.first $t@123@01)
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@111@01)))))))) self_V0@108@01 v_V0@109@01))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (not
    (=
      self_V0@108@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@122@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@111@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second $t@111@01)))
        ($Snap.combine
          ($Snap.first $t@123@01)
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@111@01)))))))) self_V0@108@01 v_V0@109@01)))
(push) ; 11
(assert (not (Contains_8a1a376e_PMTree ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@122@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@111@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@111@01)))
      ($Snap.combine
        ($Snap.first $t@123@01)
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@111@01)))))))) self_V0@108@01 v_V0@109@01)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (Contains_8a1a376e_PMTree ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@122@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@111@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@111@01)))
      ($Snap.combine
        ($Snap.first $t@123@01)
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@111@01)))))))) self_V0@108@01 v_V0@109@01))
(pop) ; 10
(pop) ; 9
(pop) ; 8
(pop) ; 7
(push) ; 7
; [else-branch: 286 | First:(Second:($t@111@01)) + v_V0@109@01 % 2 != 0]
(assert (not
  (=
    (mod
      (+
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@111@01)))
        v_V0@109@01)
      2)
    0)))
(pop) ; 7
; [eval] !(((ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ + v_V0_CN1) % 2 == 0)
; [eval] ((ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ + v_V0_CN1) % 2 == 0
; [eval] ((ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ + v_V0_CN1) % 2
; [eval] (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ + v_V0_CN1
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (mod
    (+
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@111@01)))
      v_V0@109@01)
    2)
  0)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    (mod
      (+
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@111@01)))
        v_V0@109@01)
      2)
    0))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 292 | First:(Second:($t@111@01)) + v_V0@109@01 % 2 != 0 | live]
; [else-branch: 292 | First:(Second:($t@111@01)) + v_V0@109@01 % 2 == 0 | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 292 | First:(Second:($t@111@01)) + v_V0@109@01 % 2 != 0]
(assert (not
  (=
    (mod
      (+
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@111@01)))
        v_V0@109@01)
      2)
    0)))
; [exec]
; var N4: ShStruct3[Ref, Ref, Ref]
(declare-const N4@125@01 ShStruct3<Ref~_Ref~_Ref>)
; [exec]
; N4 := Insert_8a1a376e_PMTree((ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$,
;   v_V0_CN1)
; [eval] (ShStructget2of3(self_V0_CN0): Ref)
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 8
(pop) ; 8
; Joined path conditions
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second $t@111@01))))
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 293 | First:(Second:(Second:($t@111@01))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 293 | First:(Second:(Second:($t@111@01))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 293 | First:(Second:(Second:($t@111@01))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(declare-const res_V0@126@01 ShStruct3<Ref~_Ref~_Ref>)
(declare-const $t@127@01 $Snap)
(assert (= $t@127@01 ($Snap.combine ($Snap.first $t@127@01) ($Snap.second $t@127@01))))
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first $t@111@01))
  res_V0@126@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@127@01) $Snap.unit))
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(set-option :timeout 0)
(push) ; 9
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  res_V0@126@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@126@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 294 | res_V0@126@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 294 | res_V0@126@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 294 | res_V0@126@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    res_V0@126@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@127@01) res_V0@126@01 v_V0@109@01))
(pop) ; 10
(push) ; 10
; [else-branch: 294 | res_V0@126@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  res_V0@126@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@126@01 v_V0@109@01))
(pop) ; 10
(pop) ; 9
(declare-fun joined_Contains_8a1a376e_PMTree@128@01 (ShStruct3<Ref~_Ref~_Ref> Int) Bool)
(assert (=>
  (not
    (=
      res_V0@126@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (=
    (joined_Contains_8a1a376e_PMTree@128@01 res_V0@126@01 v_V0@109@01)
    (Contains_8a1a376e_PMTree ($Snap.first $t@127@01) res_V0@126@01 v_V0@109@01))))
(assert (=>
  (=
    res_V0@126@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (=
    (joined_Contains_8a1a376e_PMTree@128@01 res_V0@126@01 v_V0@109@01)
    (Contains_8a1a376e_PMTree $Snap.unit res_V0@126@01 v_V0@109@01))))
; Joined path conditions
(assert (=>
  (not
    (=
      res_V0@126@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (and
    (not
      (=
        res_V0@126@01
        (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
    (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@127@01) res_V0@126@01 v_V0@109@01))))
; Joined path conditions
(assert (=>
  (=
    res_V0@126@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (and
    (=
      res_V0@126@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
    (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@126@01 v_V0@109@01))))
(assert (or
  (=
    res_V0@126@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (not
    (=
      res_V0@126@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(assert (joined_Contains_8a1a376e_PMTree@128@01 res_V0@126@01 v_V0@109@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; (ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := N4
; [eval] (ShStructget2of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= (ShStructget0of3<Ref> self_V0@108@01) (ShStructget2of3<Ref> self_V0@108@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; res_V0_CN2 := self_V0_CN0
; [exec]
; fold acc(tree_8a1a376e_F(res_V0_CN2), write)
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] (ShStructget1of3(self_V0): Ref)
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] !((ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first $t@111@01))
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 295 | First:($t@111@01) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 295 | First:($t@111@01) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 295 | First:($t@111@01) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] !((ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  res_V0@126@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@126@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 296 | res_V0@126@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 296 | res_V0@126@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 296 | res_V0@126@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    res_V0@126@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
; [eval] (ShStructget2of3(self_V0): Ref)
(assert (tree_8a1a376e_F%trigger ($Snap.combine
  ($Snap.first $t@111@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@111@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@126@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@111@01))))
        ($Snap.first $t@127@01))))) self_V0@108@01))
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 11
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  self_V0@108@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 297 | self_V0@108@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 297 | self_V0@108@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 297 | self_V0@108@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.combine
  ($Snap.first $t@111@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@111@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@126@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@111@01))))
        ($Snap.first $t@127@01))))) self_V0@108@01 v_V0@109@01))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (not
    (=
      self_V0@108@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.combine
    ($Snap.first $t@111@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@111@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@126@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@111@01))))
          ($Snap.first $t@127@01))))) self_V0@108@01 v_V0@109@01)))
(push) ; 11
(assert (not (Contains_8a1a376e_PMTree ($Snap.combine
  ($Snap.first $t@111@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@111@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@126@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@111@01))))
        ($Snap.first $t@127@01))))) self_V0@108@01 v_V0@109@01)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (Contains_8a1a376e_PMTree ($Snap.combine
  ($Snap.first $t@111@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@111@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@126@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@111@01))))
        ($Snap.first $t@127@01))))) self_V0@108@01 v_V0@109@01))
(pop) ; 10
(pop) ; 9
(pop) ; 8
(pop) ; 7
(push) ; 7
; [else-branch: 292 | First:(Second:($t@111@01)) + v_V0@109@01 % 2 == 0]
(assert (=
  (mod
    (+
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@111@01)))
      v_V0@109@01)
    2)
  0))
(pop) ; 7
(pop) ; 6
(push) ; 6
; [else-branch: 285 | First:(Second:(Second:($t@111@01))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second $t@111@01))))
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@111@01))))
  $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (tree_8a1a376e_F%trigger $t@111@01 self_V0@108@01))
; [eval] ((ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ + v_V0_CN1) % 2 == 0
; [eval] ((ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ + v_V0_CN1) % 2
; [eval] (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ + v_V0_CN1
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    (mod
      (+
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@111@01)))
        v_V0@109@01)
      2)
    0))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (mod
    (+
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@111@01)))
      v_V0@109@01)
    2)
  0)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 298 | First:(Second:($t@111@01)) + v_V0@109@01 % 2 == 0 | live]
; [else-branch: 298 | First:(Second:($t@111@01)) + v_V0@109@01 % 2 != 0 | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 298 | First:(Second:($t@111@01)) + v_V0@109@01 % 2 == 0]
(assert (=
  (mod
    (+
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@111@01)))
      v_V0@109@01)
    2)
  0))
; [exec]
; var N5: ShStruct3[Ref, Ref, Ref]
(declare-const N5@129@01 ShStruct3<Ref~_Ref~_Ref>)
; [exec]
; N5 := Insert_8a1a376e_PMTree((ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$,
;   v_V0_CN1)
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 8
(pop) ; 8
; Joined path conditions
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first $t@111@01))
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 299 | First:($t@111@01) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 299 | First:($t@111@01) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 299 | First:($t@111@01) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(declare-const res_V0@130@01 ShStruct3<Ref~_Ref~_Ref>)
(declare-const $t@131@01 $Snap)
(assert (= $t@131@01 ($Snap.combine ($Snap.first $t@131@01) ($Snap.second $t@131@01))))
(assert (= ($Snap.second $t@131@01) $Snap.unit))
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 9
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  res_V0@130@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@130@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 300 | res_V0@130@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 300 | res_V0@130@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 300 | res_V0@130@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    res_V0@130@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@131@01) res_V0@130@01 v_V0@109@01))
(pop) ; 10
(push) ; 10
; [else-branch: 300 | res_V0@130@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  res_V0@130@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@130@01 v_V0@109@01))
(pop) ; 10
(pop) ; 9
(declare-fun joined_Contains_8a1a376e_PMTree@132@01 (ShStruct3<Ref~_Ref~_Ref> Int) Bool)
(assert (=>
  (not
    (=
      res_V0@130@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (=
    (joined_Contains_8a1a376e_PMTree@132@01 res_V0@130@01 v_V0@109@01)
    (Contains_8a1a376e_PMTree ($Snap.first $t@131@01) res_V0@130@01 v_V0@109@01))))
(assert (=>
  (=
    res_V0@130@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (=
    (joined_Contains_8a1a376e_PMTree@132@01 res_V0@130@01 v_V0@109@01)
    (Contains_8a1a376e_PMTree $Snap.unit res_V0@130@01 v_V0@109@01))))
; Joined path conditions
(assert (=>
  (not
    (=
      res_V0@130@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (and
    (not
      (=
        res_V0@130@01
        (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
    (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@131@01) res_V0@130@01 v_V0@109@01))))
; Joined path conditions
(assert (=>
  (=
    res_V0@130@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (and
    (=
      res_V0@130@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
    (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@130@01 v_V0@109@01))))
(assert (or
  (=
    res_V0@130@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (not
    (=
      res_V0@130@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(assert (joined_Contains_8a1a376e_PMTree@132@01 res_V0@130@01 v_V0@109@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; (ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := N5
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= (ShStructget2of3<Ref> self_V0@108@01) (ShStructget0of3<Ref> self_V0@108@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; res_V0_CN2 := self_V0_CN0
; [exec]
; fold acc(tree_8a1a376e_F(res_V0_CN2), write)
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] (ShStructget1of3(self_V0): Ref)
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] !((ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  res_V0@130@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@130@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 301 | res_V0@130@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 301 | res_V0@130@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 301 | res_V0@130@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    res_V0@130@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] !((ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 10
(pop) ; 10
; Joined path conditions
; [then-branch: 302 | First:(Second:(Second:($t@111@01))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 302 | First:(Second:(Second:($t@111@01))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 10
; [else-branch: 302 | First:(Second:(Second:($t@111@01))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (tree_8a1a376e_F%trigger ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@130@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@111@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@111@01)))
      ($Snap.combine ($Snap.first $t@131@01) $Snap.unit)))) self_V0@108@01))
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 11
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  self_V0@108@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 303 | self_V0@108@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 303 | self_V0@108@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 303 | self_V0@108@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@130@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@111@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@111@01)))
      ($Snap.combine ($Snap.first $t@131@01) $Snap.unit)))) self_V0@108@01 v_V0@109@01))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (not
    (=
      self_V0@108@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@130@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@111@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second $t@111@01)))
        ($Snap.combine ($Snap.first $t@131@01) $Snap.unit)))) self_V0@108@01 v_V0@109@01)))
(push) ; 11
(assert (not (Contains_8a1a376e_PMTree ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@130@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@111@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@111@01)))
      ($Snap.combine ($Snap.first $t@131@01) $Snap.unit)))) self_V0@108@01 v_V0@109@01)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (Contains_8a1a376e_PMTree ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@130@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@111@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@111@01)))
      ($Snap.combine ($Snap.first $t@131@01) $Snap.unit)))) self_V0@108@01 v_V0@109@01))
(pop) ; 10
(pop) ; 9
(pop) ; 8
(pop) ; 7
(push) ; 7
; [else-branch: 298 | First:(Second:($t@111@01)) + v_V0@109@01 % 2 != 0]
(assert (not
  (=
    (mod
      (+
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@111@01)))
        v_V0@109@01)
      2)
    0)))
(pop) ; 7
; [eval] !(((ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ + v_V0_CN1) % 2 == 0)
; [eval] ((ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ + v_V0_CN1) % 2 == 0
; [eval] ((ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ + v_V0_CN1) % 2
; [eval] (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ + v_V0_CN1
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (mod
    (+
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@111@01)))
      v_V0@109@01)
    2)
  0)))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    (mod
      (+
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@111@01)))
        v_V0@109@01)
      2)
    0))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 304 | First:(Second:($t@111@01)) + v_V0@109@01 % 2 != 0 | live]
; [else-branch: 304 | First:(Second:($t@111@01)) + v_V0@109@01 % 2 == 0 | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 304 | First:(Second:($t@111@01)) + v_V0@109@01 % 2 != 0]
(assert (not
  (=
    (mod
      (+
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@111@01)))
        v_V0@109@01)
      2)
    0)))
; [exec]
; var N4: ShStruct3[Ref, Ref, Ref]
(declare-const N4@133@01 ShStruct3<Ref~_Ref~_Ref>)
; [exec]
; N4 := Insert_8a1a376e_PMTree((ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$,
;   v_V0_CN1)
; [eval] (ShStructget2of3(self_V0_CN0): Ref)
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 8
(pop) ; 8
; Joined path conditions
; [then-branch: 305 | First:(Second:(Second:($t@111@01))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 305 | First:(Second:(Second:($t@111@01))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 8
; [else-branch: 305 | First:(Second:(Second:($t@111@01))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(declare-const res_V0@134@01 ShStruct3<Ref~_Ref~_Ref>)
(declare-const $t@135@01 $Snap)
(assert (= $t@135@01 ($Snap.combine ($Snap.first $t@135@01) ($Snap.second $t@135@01))))
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first $t@111@01))
  res_V0@134@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@135@01) $Snap.unit))
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(set-option :timeout 0)
(push) ; 9
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  res_V0@134@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@134@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 306 | res_V0@134@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 306 | res_V0@134@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 306 | res_V0@134@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    res_V0@134@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@135@01) res_V0@134@01 v_V0@109@01))
(pop) ; 10
(push) ; 10
; [else-branch: 306 | res_V0@134@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  res_V0@134@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@134@01 v_V0@109@01))
(pop) ; 10
(pop) ; 9
(declare-fun joined_Contains_8a1a376e_PMTree@136@01 (ShStruct3<Ref~_Ref~_Ref> Int) Bool)
(assert (=>
  (not
    (=
      res_V0@134@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (=
    (joined_Contains_8a1a376e_PMTree@136@01 res_V0@134@01 v_V0@109@01)
    (Contains_8a1a376e_PMTree ($Snap.first $t@135@01) res_V0@134@01 v_V0@109@01))))
(assert (=>
  (=
    res_V0@134@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (=
    (joined_Contains_8a1a376e_PMTree@136@01 res_V0@134@01 v_V0@109@01)
    (Contains_8a1a376e_PMTree $Snap.unit res_V0@134@01 v_V0@109@01))))
; Joined path conditions
(assert (=>
  (not
    (=
      res_V0@134@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (and
    (not
      (=
        res_V0@134@01
        (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
    (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@135@01) res_V0@134@01 v_V0@109@01))))
; Joined path conditions
(assert (=>
  (=
    res_V0@134@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (and
    (=
      res_V0@134@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
    (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@134@01 v_V0@109@01))))
(assert (or
  (=
    res_V0@134@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (not
    (=
      res_V0@134@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(assert (joined_Contains_8a1a376e_PMTree@136@01 res_V0@134@01 v_V0@109@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; (ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := N4
; [eval] (ShStructget2of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= (ShStructget0of3<Ref> self_V0@108@01) (ShStructget2of3<Ref> self_V0@108@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; res_V0_CN2 := self_V0_CN0
; [exec]
; fold acc(tree_8a1a376e_F(res_V0_CN2), write)
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] (ShStructget1of3(self_V0): Ref)
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] !((ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first $t@111@01))
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 307 | First:($t@111@01) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 307 | First:($t@111@01) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 307 | First:($t@111@01) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] !((ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  res_V0@134@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@134@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 308 | res_V0@134@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 308 | res_V0@134@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 308 | res_V0@134@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    res_V0@134@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
; [eval] (ShStructget2of3(self_V0): Ref)
(assert (tree_8a1a376e_F%trigger ($Snap.combine
  ($Snap.first $t@111@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@111@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@134@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@111@01))))
        ($Snap.first $t@135@01))))) self_V0@108@01))
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 11
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  self_V0@108@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 309 | self_V0@108@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 309 | self_V0@108@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 309 | self_V0@108@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.combine
  ($Snap.first $t@111@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@111@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@134@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@111@01))))
        ($Snap.first $t@135@01))))) self_V0@108@01 v_V0@109@01))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (not
    (=
      self_V0@108@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.combine
    ($Snap.first $t@111@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@111@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@134@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@111@01))))
          ($Snap.first $t@135@01))))) self_V0@108@01 v_V0@109@01)))
(push) ; 11
(assert (not (Contains_8a1a376e_PMTree ($Snap.combine
  ($Snap.first $t@111@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@111@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@134@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@111@01))))
        ($Snap.first $t@135@01))))) self_V0@108@01 v_V0@109@01)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (Contains_8a1a376e_PMTree ($Snap.combine
  ($Snap.first $t@111@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@111@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@134@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@111@01))))
        ($Snap.first $t@135@01))))) self_V0@108@01 v_V0@109@01))
(pop) ; 10
(pop) ; 9
(pop) ; 8
(pop) ; 7
(push) ; 7
; [else-branch: 304 | First:(Second:($t@111@01)) + v_V0@109@01 % 2 == 0]
(assert (=
  (mod
    (+
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@111@01)))
      v_V0@109@01)
    2)
  0))
(pop) ; 7
(pop) ; 6
(pop) ; 5
(push) ; 5
; [else-branch: 284 | First:($t@111@01) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first $t@111@01))
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@111@01))))
  $Snap.unit))
; [eval] !((ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second $t@111@01))))
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second $t@111@01))))
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 310 | First:(Second:(Second:($t@111@01))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 310 | First:(Second:(Second:($t@111@01))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 310 | First:(Second:(Second:($t@111@01))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second $t@111@01))))
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
; [eval] (ShStructget2of3(self_V0): Ref)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (tree_8a1a376e_F%trigger $t@111@01 self_V0@108@01))
; [eval] ((ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ + v_V0_CN1) % 2 == 0
; [eval] ((ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ + v_V0_CN1) % 2
; [eval] (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ + v_V0_CN1
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    (mod
      (+
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@111@01)))
        v_V0@109@01)
      2)
    0))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (mod
    (+
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@111@01)))
      v_V0@109@01)
    2)
  0)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 311 | First:(Second:($t@111@01)) + v_V0@109@01 % 2 == 0 | live]
; [else-branch: 311 | First:(Second:($t@111@01)) + v_V0@109@01 % 2 != 0 | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 311 | First:(Second:($t@111@01)) + v_V0@109@01 % 2 == 0]
(assert (=
  (mod
    (+
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@111@01)))
      v_V0@109@01)
    2)
  0))
; [exec]
; var N5: ShStruct3[Ref, Ref, Ref]
(declare-const N5@137@01 ShStruct3<Ref~_Ref~_Ref>)
; [exec]
; N5 := Insert_8a1a376e_PMTree((ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$,
;   v_V0_CN1)
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 8
(pop) ; 8
; Joined path conditions
; [then-branch: 312 | First:($t@111@01) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 312 | First:($t@111@01) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 8
; [else-branch: 312 | First:($t@111@01) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(declare-const res_V0@138@01 ShStruct3<Ref~_Ref~_Ref>)
(declare-const $t@139@01 $Snap)
(assert (= $t@139@01 ($Snap.combine ($Snap.first $t@139@01) ($Snap.second $t@139@01))))
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second $t@111@01))))
  res_V0@138@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@139@01) $Snap.unit))
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(set-option :timeout 0)
(push) ; 9
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  res_V0@138@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@138@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 313 | res_V0@138@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 313 | res_V0@138@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 313 | res_V0@138@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    res_V0@138@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@139@01) res_V0@138@01 v_V0@109@01))
(pop) ; 10
(push) ; 10
; [else-branch: 313 | res_V0@138@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  res_V0@138@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@138@01 v_V0@109@01))
(pop) ; 10
(pop) ; 9
(declare-fun joined_Contains_8a1a376e_PMTree@140@01 (ShStruct3<Ref~_Ref~_Ref> Int) Bool)
(assert (=>
  (not
    (=
      res_V0@138@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (=
    (joined_Contains_8a1a376e_PMTree@140@01 res_V0@138@01 v_V0@109@01)
    (Contains_8a1a376e_PMTree ($Snap.first $t@139@01) res_V0@138@01 v_V0@109@01))))
(assert (=>
  (=
    res_V0@138@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (=
    (joined_Contains_8a1a376e_PMTree@140@01 res_V0@138@01 v_V0@109@01)
    (Contains_8a1a376e_PMTree $Snap.unit res_V0@138@01 v_V0@109@01))))
; Joined path conditions
(assert (=>
  (not
    (=
      res_V0@138@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (and
    (not
      (=
        res_V0@138@01
        (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
    (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@139@01) res_V0@138@01 v_V0@109@01))))
; Joined path conditions
(assert (=>
  (=
    res_V0@138@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (and
    (=
      res_V0@138@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
    (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@138@01 v_V0@109@01))))
(assert (or
  (=
    res_V0@138@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (not
    (=
      res_V0@138@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(assert (joined_Contains_8a1a376e_PMTree@140@01 res_V0@138@01 v_V0@109@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; (ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := N5
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= (ShStructget2of3<Ref> self_V0@108@01) (ShStructget0of3<Ref> self_V0@108@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; res_V0_CN2 := self_V0_CN0
; [exec]
; fold acc(tree_8a1a376e_F(res_V0_CN2), write)
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] (ShStructget1of3(self_V0): Ref)
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] !((ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  res_V0@138@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@138@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 314 | res_V0@138@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 314 | res_V0@138@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 314 | res_V0@138@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    res_V0@138@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] !((ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second $t@111@01))))
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 315 | First:(Second:(Second:($t@111@01))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 315 | First:(Second:(Second:($t@111@01))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 315 | First:(Second:(Second:($t@111@01))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] (ShStructget2of3(self_V0): Ref)
(assert (tree_8a1a376e_F%trigger ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@138@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@111@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@111@01)))
      ($Snap.combine
        ($Snap.first $t@139@01)
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@111@01)))))))) self_V0@108@01))
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 11
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  self_V0@108@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 316 | self_V0@108@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 316 | self_V0@108@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 316 | self_V0@108@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@138@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@111@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@111@01)))
      ($Snap.combine
        ($Snap.first $t@139@01)
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@111@01)))))))) self_V0@108@01 v_V0@109@01))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (not
    (=
      self_V0@108@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@138@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@111@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second $t@111@01)))
        ($Snap.combine
          ($Snap.first $t@139@01)
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@111@01)))))))) self_V0@108@01 v_V0@109@01)))
(push) ; 11
(assert (not (Contains_8a1a376e_PMTree ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@138@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@111@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@111@01)))
      ($Snap.combine
        ($Snap.first $t@139@01)
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@111@01)))))))) self_V0@108@01 v_V0@109@01)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (Contains_8a1a376e_PMTree ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@138@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@111@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@111@01)))
      ($Snap.combine
        ($Snap.first $t@139@01)
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@111@01)))))))) self_V0@108@01 v_V0@109@01))
(pop) ; 10
(pop) ; 9
(pop) ; 8
(pop) ; 7
(push) ; 7
; [else-branch: 311 | First:(Second:($t@111@01)) + v_V0@109@01 % 2 != 0]
(assert (not
  (=
    (mod
      (+
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@111@01)))
        v_V0@109@01)
      2)
    0)))
(pop) ; 7
; [eval] !(((ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ + v_V0_CN1) % 2 == 0)
; [eval] ((ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ + v_V0_CN1) % 2 == 0
; [eval] ((ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ + v_V0_CN1) % 2
; [eval] (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ + v_V0_CN1
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (mod
    (+
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@111@01)))
      v_V0@109@01)
    2)
  0)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    (mod
      (+
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@111@01)))
        v_V0@109@01)
      2)
    0))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 317 | First:(Second:($t@111@01)) + v_V0@109@01 % 2 != 0 | live]
; [else-branch: 317 | First:(Second:($t@111@01)) + v_V0@109@01 % 2 == 0 | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 317 | First:(Second:($t@111@01)) + v_V0@109@01 % 2 != 0]
(assert (not
  (=
    (mod
      (+
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@111@01)))
        v_V0@109@01)
      2)
    0)))
; [exec]
; var N4: ShStruct3[Ref, Ref, Ref]
(declare-const N4@141@01 ShStruct3<Ref~_Ref~_Ref>)
; [exec]
; N4 := Insert_8a1a376e_PMTree((ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$,
;   v_V0_CN1)
; [eval] (ShStructget2of3(self_V0_CN0): Ref)
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 8
(pop) ; 8
; Joined path conditions
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second $t@111@01))))
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 318 | First:(Second:(Second:($t@111@01))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 318 | First:(Second:(Second:($t@111@01))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 318 | First:(Second:(Second:($t@111@01))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(declare-const res_V0@142@01 ShStruct3<Ref~_Ref~_Ref>)
(declare-const $t@143@01 $Snap)
(assert (= $t@143@01 ($Snap.combine ($Snap.first $t@143@01) ($Snap.second $t@143@01))))
(assert (= ($Snap.second $t@143@01) $Snap.unit))
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 9
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  res_V0@142@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@142@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 319 | res_V0@142@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 319 | res_V0@142@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 319 | res_V0@142@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    res_V0@142@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@143@01) res_V0@142@01 v_V0@109@01))
(pop) ; 10
(push) ; 10
; [else-branch: 319 | res_V0@142@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  res_V0@142@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@142@01 v_V0@109@01))
(pop) ; 10
(pop) ; 9
(declare-fun joined_Contains_8a1a376e_PMTree@144@01 (ShStruct3<Ref~_Ref~_Ref> Int) Bool)
(assert (=>
  (not
    (=
      res_V0@142@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (=
    (joined_Contains_8a1a376e_PMTree@144@01 res_V0@142@01 v_V0@109@01)
    (Contains_8a1a376e_PMTree ($Snap.first $t@143@01) res_V0@142@01 v_V0@109@01))))
(assert (=>
  (=
    res_V0@142@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (=
    (joined_Contains_8a1a376e_PMTree@144@01 res_V0@142@01 v_V0@109@01)
    (Contains_8a1a376e_PMTree $Snap.unit res_V0@142@01 v_V0@109@01))))
; Joined path conditions
(assert (=>
  (not
    (=
      res_V0@142@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (and
    (not
      (=
        res_V0@142@01
        (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
    (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@143@01) res_V0@142@01 v_V0@109@01))))
; Joined path conditions
(assert (=>
  (=
    res_V0@142@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (and
    (=
      res_V0@142@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
    (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@142@01 v_V0@109@01))))
(assert (or
  (=
    res_V0@142@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (not
    (=
      res_V0@142@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(assert (joined_Contains_8a1a376e_PMTree@144@01 res_V0@142@01 v_V0@109@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; (ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := N4
; [eval] (ShStructget2of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= (ShStructget0of3<Ref> self_V0@108@01) (ShStructget2of3<Ref> self_V0@108@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; res_V0_CN2 := self_V0_CN0
; [exec]
; fold acc(tree_8a1a376e_F(res_V0_CN2), write)
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] (ShStructget1of3(self_V0): Ref)
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] !((ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 9
(pop) ; 9
; Joined path conditions
; [then-branch: 320 | First:($t@111@01) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 320 | First:($t@111@01) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 9
; [else-branch: 320 | First:($t@111@01) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !((ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  res_V0@142@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@142@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 321 | res_V0@142@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 321 | res_V0@142@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 321 | res_V0@142@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    res_V0@142@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
; [eval] (ShStructget2of3(self_V0): Ref)
(assert (tree_8a1a376e_F%trigger ($Snap.combine
  ($Snap.first $t@111@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@111@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@142@01)
      ($Snap.combine $Snap.unit ($Snap.first $t@143@01))))) self_V0@108@01))
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 11
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  self_V0@108@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 322 | self_V0@108@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 322 | self_V0@108@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 322 | self_V0@108@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.combine
  ($Snap.first $t@111@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@111@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@142@01)
      ($Snap.combine $Snap.unit ($Snap.first $t@143@01))))) self_V0@108@01 v_V0@109@01))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (not
    (=
      self_V0@108@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.combine
    ($Snap.first $t@111@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@111@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@142@01)
        ($Snap.combine $Snap.unit ($Snap.first $t@143@01))))) self_V0@108@01 v_V0@109@01)))
(push) ; 11
(assert (not (Contains_8a1a376e_PMTree ($Snap.combine
  ($Snap.first $t@111@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@111@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@142@01)
      ($Snap.combine $Snap.unit ($Snap.first $t@143@01))))) self_V0@108@01 v_V0@109@01)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (Contains_8a1a376e_PMTree ($Snap.combine
  ($Snap.first $t@111@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@111@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@142@01)
      ($Snap.combine $Snap.unit ($Snap.first $t@143@01))))) self_V0@108@01 v_V0@109@01))
(pop) ; 10
(pop) ; 9
(pop) ; 8
(pop) ; 7
(push) ; 7
; [else-branch: 317 | First:(Second:($t@111@01)) + v_V0@109@01 % 2 == 0]
(assert (=
  (mod
    (+
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@111@01)))
      v_V0@109@01)
    2)
  0))
(pop) ; 7
(pop) ; 6
(push) ; 6
; [else-branch: 310 | First:(Second:(Second:($t@111@01))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second $t@111@01))))
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@111@01))))
  $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (tree_8a1a376e_F%trigger $t@111@01 self_V0@108@01))
; [eval] ((ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ + v_V0_CN1) % 2 == 0
; [eval] ((ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ + v_V0_CN1) % 2
; [eval] (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ + v_V0_CN1
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    (mod
      (+
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@111@01)))
        v_V0@109@01)
      2)
    0))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (mod
    (+
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@111@01)))
      v_V0@109@01)
    2)
  0)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 323 | First:(Second:($t@111@01)) + v_V0@109@01 % 2 == 0 | live]
; [else-branch: 323 | First:(Second:($t@111@01)) + v_V0@109@01 % 2 != 0 | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 323 | First:(Second:($t@111@01)) + v_V0@109@01 % 2 == 0]
(assert (=
  (mod
    (+
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@111@01)))
      v_V0@109@01)
    2)
  0))
; [exec]
; var N5: ShStruct3[Ref, Ref, Ref]
(declare-const N5@145@01 ShStruct3<Ref~_Ref~_Ref>)
; [exec]
; N5 := Insert_8a1a376e_PMTree((ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$,
;   v_V0_CN1)
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 8
(pop) ; 8
; Joined path conditions
; [then-branch: 324 | First:($t@111@01) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 324 | First:($t@111@01) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 8
; [else-branch: 324 | First:($t@111@01) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(declare-const res_V0@146@01 ShStruct3<Ref~_Ref~_Ref>)
(declare-const $t@147@01 $Snap)
(assert (= $t@147@01 ($Snap.combine ($Snap.first $t@147@01) ($Snap.second $t@147@01))))
(assert (= ($Snap.second $t@147@01) $Snap.unit))
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 9
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  res_V0@146@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@146@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 325 | res_V0@146@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 325 | res_V0@146@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 325 | res_V0@146@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    res_V0@146@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@147@01) res_V0@146@01 v_V0@109@01))
(pop) ; 10
(push) ; 10
; [else-branch: 325 | res_V0@146@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  res_V0@146@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@146@01 v_V0@109@01))
(pop) ; 10
(pop) ; 9
(declare-fun joined_Contains_8a1a376e_PMTree@148@01 (ShStruct3<Ref~_Ref~_Ref> Int) Bool)
(assert (=>
  (not
    (=
      res_V0@146@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (=
    (joined_Contains_8a1a376e_PMTree@148@01 res_V0@146@01 v_V0@109@01)
    (Contains_8a1a376e_PMTree ($Snap.first $t@147@01) res_V0@146@01 v_V0@109@01))))
(assert (=>
  (=
    res_V0@146@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (=
    (joined_Contains_8a1a376e_PMTree@148@01 res_V0@146@01 v_V0@109@01)
    (Contains_8a1a376e_PMTree $Snap.unit res_V0@146@01 v_V0@109@01))))
; Joined path conditions
(assert (=>
  (not
    (=
      res_V0@146@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (and
    (not
      (=
        res_V0@146@01
        (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
    (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@147@01) res_V0@146@01 v_V0@109@01))))
; Joined path conditions
(assert (=>
  (=
    res_V0@146@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (and
    (=
      res_V0@146@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
    (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@146@01 v_V0@109@01))))
(assert (or
  (=
    res_V0@146@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (not
    (=
      res_V0@146@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(assert (joined_Contains_8a1a376e_PMTree@148@01 res_V0@146@01 v_V0@109@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; (ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := N5
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= (ShStructget2of3<Ref> self_V0@108@01) (ShStructget0of3<Ref> self_V0@108@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; res_V0_CN2 := self_V0_CN0
; [exec]
; fold acc(tree_8a1a376e_F(res_V0_CN2), write)
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] (ShStructget1of3(self_V0): Ref)
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] !((ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  res_V0@146@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@146@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 326 | res_V0@146@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 326 | res_V0@146@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 326 | res_V0@146@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    res_V0@146@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] !((ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 10
(pop) ; 10
; Joined path conditions
; [then-branch: 327 | First:(Second:(Second:($t@111@01))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 327 | First:(Second:(Second:($t@111@01))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 10
; [else-branch: 327 | First:(Second:(Second:($t@111@01))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (tree_8a1a376e_F%trigger ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@146@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@111@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@111@01)))
      ($Snap.combine ($Snap.first $t@147@01) $Snap.unit)))) self_V0@108@01))
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 11
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  self_V0@108@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 328 | self_V0@108@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 328 | self_V0@108@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 328 | self_V0@108@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@146@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@111@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@111@01)))
      ($Snap.combine ($Snap.first $t@147@01) $Snap.unit)))) self_V0@108@01 v_V0@109@01))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (not
    (=
      self_V0@108@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@146@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@111@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second $t@111@01)))
        ($Snap.combine ($Snap.first $t@147@01) $Snap.unit)))) self_V0@108@01 v_V0@109@01)))
(push) ; 11
(assert (not (Contains_8a1a376e_PMTree ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@146@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@111@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@111@01)))
      ($Snap.combine ($Snap.first $t@147@01) $Snap.unit)))) self_V0@108@01 v_V0@109@01)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (Contains_8a1a376e_PMTree ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@146@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@111@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@111@01)))
      ($Snap.combine ($Snap.first $t@147@01) $Snap.unit)))) self_V0@108@01 v_V0@109@01))
(pop) ; 10
(pop) ; 9
(pop) ; 8
(pop) ; 7
(push) ; 7
; [else-branch: 323 | First:(Second:($t@111@01)) + v_V0@109@01 % 2 != 0]
(assert (not
  (=
    (mod
      (+
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@111@01)))
        v_V0@109@01)
      2)
    0)))
(pop) ; 7
; [eval] !(((ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ + v_V0_CN1) % 2 == 0)
; [eval] ((ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ + v_V0_CN1) % 2 == 0
; [eval] ((ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ + v_V0_CN1) % 2
; [eval] (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$ + v_V0_CN1
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (mod
    (+
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@111@01)))
      v_V0@109@01)
    2)
  0)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    (mod
      (+
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@111@01)))
        v_V0@109@01)
      2)
    0))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 329 | First:(Second:($t@111@01)) + v_V0@109@01 % 2 != 0 | live]
; [else-branch: 329 | First:(Second:($t@111@01)) + v_V0@109@01 % 2 == 0 | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 329 | First:(Second:($t@111@01)) + v_V0@109@01 % 2 != 0]
(assert (not
  (=
    (mod
      (+
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@111@01)))
        v_V0@109@01)
      2)
    0)))
; [exec]
; var N4: ShStruct3[Ref, Ref, Ref]
(declare-const N4@149@01 ShStruct3<Ref~_Ref~_Ref>)
; [exec]
; N4 := Insert_8a1a376e_PMTree((ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$,
;   v_V0_CN1)
; [eval] (ShStructget2of3(self_V0_CN0): Ref)
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 8
(pop) ; 8
; Joined path conditions
; [then-branch: 330 | First:(Second:(Second:($t@111@01))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 330 | First:(Second:(Second:($t@111@01))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 8
; [else-branch: 330 | First:(Second:(Second:($t@111@01))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(declare-const res_V0@150@01 ShStruct3<Ref~_Ref~_Ref>)
(declare-const $t@151@01 $Snap)
(assert (= $t@151@01 ($Snap.combine ($Snap.first $t@151@01) ($Snap.second $t@151@01))))
(assert (= ($Snap.second $t@151@01) $Snap.unit))
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 9
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  res_V0@150@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@150@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 331 | res_V0@150@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 331 | res_V0@150@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 331 | res_V0@150@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    res_V0@150@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@151@01) res_V0@150@01 v_V0@109@01))
(pop) ; 10
(push) ; 10
; [else-branch: 331 | res_V0@150@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  res_V0@150@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@150@01 v_V0@109@01))
(pop) ; 10
(pop) ; 9
(declare-fun joined_Contains_8a1a376e_PMTree@152@01 (ShStruct3<Ref~_Ref~_Ref> Int) Bool)
(assert (=>
  (not
    (=
      res_V0@150@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (=
    (joined_Contains_8a1a376e_PMTree@152@01 res_V0@150@01 v_V0@109@01)
    (Contains_8a1a376e_PMTree ($Snap.first $t@151@01) res_V0@150@01 v_V0@109@01))))
(assert (=>
  (=
    res_V0@150@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (=
    (joined_Contains_8a1a376e_PMTree@152@01 res_V0@150@01 v_V0@109@01)
    (Contains_8a1a376e_PMTree $Snap.unit res_V0@150@01 v_V0@109@01))))
; Joined path conditions
(assert (=>
  (not
    (=
      res_V0@150@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (and
    (not
      (=
        res_V0@150@01
        (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
    (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@151@01) res_V0@150@01 v_V0@109@01))))
; Joined path conditions
(assert (=>
  (=
    res_V0@150@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (and
    (=
      res_V0@150@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
    (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@150@01 v_V0@109@01))))
(assert (or
  (=
    res_V0@150@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (not
    (=
      res_V0@150@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(assert (joined_Contains_8a1a376e_PMTree@152@01 res_V0@150@01 v_V0@109@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; (ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := N4
; [eval] (ShStructget2of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= (ShStructget0of3<Ref> self_V0@108@01) (ShStructget2of3<Ref> self_V0@108@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; res_V0_CN2 := self_V0_CN0
; [exec]
; fold acc(tree_8a1a376e_F(res_V0_CN2), write)
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] (ShStructget1of3(self_V0): Ref)
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] !((ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 9
(pop) ; 9
; Joined path conditions
; [then-branch: 332 | First:($t@111@01) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 332 | First:($t@111@01) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 9
; [else-branch: 332 | First:($t@111@01) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !((ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  res_V0@150@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@150@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 333 | res_V0@150@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 333 | res_V0@150@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 333 | res_V0@150@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    res_V0@150@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
; [eval] (ShStructget2of3(self_V0): Ref)
(assert (tree_8a1a376e_F%trigger ($Snap.combine
  ($Snap.first $t@111@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@111@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@150@01)
      ($Snap.combine $Snap.unit ($Snap.first $t@151@01))))) self_V0@108@01))
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 11
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  self_V0@108@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 334 | self_V0@108@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 334 | self_V0@108@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 334 | self_V0@108@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.combine
  ($Snap.first $t@111@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@111@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@150@01)
      ($Snap.combine $Snap.unit ($Snap.first $t@151@01))))) self_V0@108@01 v_V0@109@01))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (not
    (=
      self_V0@108@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.combine
    ($Snap.first $t@111@01)
    ($Snap.combine
      ($Snap.first ($Snap.second $t@111@01))
      ($Snap.combine
        ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@150@01)
        ($Snap.combine $Snap.unit ($Snap.first $t@151@01))))) self_V0@108@01 v_V0@109@01)))
(push) ; 11
(assert (not (Contains_8a1a376e_PMTree ($Snap.combine
  ($Snap.first $t@111@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@111@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@150@01)
      ($Snap.combine $Snap.unit ($Snap.first $t@151@01))))) self_V0@108@01 v_V0@109@01)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (Contains_8a1a376e_PMTree ($Snap.combine
  ($Snap.first $t@111@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@111@01))
    ($Snap.combine
      ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@150@01)
      ($Snap.combine $Snap.unit ($Snap.first $t@151@01))))) self_V0@108@01 v_V0@109@01))
(pop) ; 10
(pop) ; 9
(pop) ; 8
(pop) ; 7
(push) ; 7
; [else-branch: 329 | First:(Second:($t@111@01)) + v_V0@109@01 % 2 == 0]
(assert (=
  (mod
    (+
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@111@01)))
      v_V0@109@01)
    2)
  0))
(pop) ; 7
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(push) ; 2
; [else-branch: 280 | self_V0@108@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  self_V0@108@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(declare-const $t@153@01 $Snap)
(assert (= $t@153@01 $Snap.unit))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(declare-const $t@154@01 $Snap)
(assert (= $t@154@01 ($Snap.combine ($Snap.first $t@154@01) ($Snap.second $t@154@01))))
(assert (= ($Snap.second $t@154@01) $Snap.unit))
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 4
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  res_V0@110@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@110@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 335 | res_V0@110@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 335 | res_V0@110@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 335 | res_V0@110@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    res_V0@110@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@154@01) res_V0@110@01 v_V0@109@01))
(pop) ; 5
(push) ; 5
; [else-branch: 335 | res_V0@110@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  res_V0@110@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@110@01 v_V0@109@01))
(pop) ; 5
(pop) ; 4
(declare-fun joined_Contains_8a1a376e_PMTree@155@01 (ShStruct3<Ref~_Ref~_Ref> Int) Bool)
(assert (=>
  (not
    (=
      res_V0@110@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (=
    (joined_Contains_8a1a376e_PMTree@155@01 res_V0@110@01 v_V0@109@01)
    (Contains_8a1a376e_PMTree ($Snap.first $t@154@01) res_V0@110@01 v_V0@109@01))))
(assert (=>
  (=
    res_V0@110@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (=
    (joined_Contains_8a1a376e_PMTree@155@01 res_V0@110@01 v_V0@109@01)
    (Contains_8a1a376e_PMTree $Snap.unit res_V0@110@01 v_V0@109@01))))
; Joined path conditions
(assert (=>
  (not
    (=
      res_V0@110@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (and
    (not
      (=
        res_V0@110@01
        (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
    (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@154@01) res_V0@110@01 v_V0@109@01))))
; Joined path conditions
(assert (=>
  (=
    res_V0@110@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (and
    (=
      res_V0@110@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
    (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@110@01 v_V0@109@01))))
(assert (or
  (=
    res_V0@110@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (not
    (=
      res_V0@110@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(assert (joined_Contains_8a1a376e_PMTree@155@01 res_V0@110@01 v_V0@109@01))
(pop) ; 3
(push) ; 3
; [exec]
; var res_V0_CN2: ShStruct3[Ref, Ref, Ref]
(declare-const res_V0_CN2@156@01 ShStruct3<Ref~_Ref~_Ref>)
; [exec]
; var v_V0_CN1: Int
(declare-const v_V0_CN1@157@01 Int)
; [exec]
; var self_V0_CN0: ShStruct3[Ref, Ref, Ref]
(declare-const self_V0_CN0@158@01 ShStruct3<Ref~_Ref~_Ref>)
; [exec]
; inhale res_V0 ==
;   shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(declare-const $t@159@01 $Snap)
(assert (= $t@159@01 $Snap.unit))
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 4
(pop) ; 4
; Joined path conditions
(assert (=
  res_V0@110@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale self_V0_CN0 ==
;   shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(declare-const $t@160@01 $Snap)
(assert (= $t@160@01 $Snap.unit))
; [eval] self_V0_CN0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 4
(pop) ; 4
; Joined path conditions
(assert (=
  self_V0_CN0@158@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale v_V0_CN1 == 0
(declare-const $t@161@01 $Snap)
(assert (= $t@161@01 $Snap.unit))
; [eval] v_V0_CN1 == 0
(assert (= v_V0_CN1@157@01 0))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale res_V0_CN2 ==
;   shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(declare-const $t@162@01 $Snap)
(assert (= $t@162@01 $Snap.unit))
; [eval] res_V0_CN2 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 4
(pop) ; 4
; Joined path conditions
(assert (=
  res_V0_CN2@156@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; self_V0_CN0 := self_V0
; [exec]
; v_V0_CN1 := v_V0
; [eval] self_V0_CN0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    self_V0@108@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 336 | self_V0@108@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 336 | self_V0@108@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 336 | self_V0@108@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [exec]
; var N6: ShStruct3[Ref, Ref, Ref]
(declare-const N6@163@01 ShStruct3<Ref~_Ref~_Ref>)
; [exec]
; var fn$$0: ShStruct3[Ref, Ref, Ref]
(declare-const fn$$0@164@01 ShStruct3<Ref~_Ref~_Ref>)
; [exec]
; inhale (let fn$$1 ==
;     (fn$$0) in
;     acc((ShStructget0of3(fn$$1): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$, write) &&
;     (acc((ShStructget1of3(fn$$1): Ref).Intint$$$$_E_$$$, write) &&
;     acc((ShStructget2of3(fn$$1): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$, write))) &&
;   (let fn$$2 ==
;     (fn$$0) in
;     (let fn$$3 ==
;       ((tuple3(shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(),
;       v_V0_CN1, shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()): Tuple3[ShStruct3[Ref, Ref, Ref], Int, ShStruct3[Ref, Ref, Ref]])) in
;       (ShStructget0of3(fn$$2): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ ==
;       (get0of3(fn$$3): ShStruct3[Ref, Ref, Ref]) &&
;       ((ShStructget1of3(fn$$2): Ref).Intint$$$$_E_$$$ ==
;       (get1of3(fn$$3): Int) &&
;       (ShStructget2of3(fn$$2): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ ==
;       (get2of3(fn$$3): ShStruct3[Ref, Ref, Ref]))))
(declare-const $t@165@01 $Snap)
(assert (= $t@165@01 ($Snap.combine ($Snap.first $t@165@01) ($Snap.second $t@165@01))))
(assert (=
  ($Snap.first $t@165@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@165@01))
    ($Snap.second ($Snap.first $t@165@01)))))
; [eval] (ShStructget0of3(fn$$1): Ref)
(assert (not (= (ShStructget0of3<Ref> fn$$0@164@01) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first $t@165@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@165@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@165@01))))))
; [eval] (ShStructget1of3(fn$$1): Ref)
(assert (not (= (ShStructget1of3<Ref> fn$$0@164@01) $Ref.null)))
; [eval] (ShStructget2of3(fn$$1): Ref)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (ShStructget0of3<Ref> fn$$0@164@01) (ShStructget2of3<Ref> fn$$0@164@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= (ShStructget2of3<Ref> fn$$0@164@01) $Ref.null)))
(assert (= ($Snap.second $t@165@01) $Snap.unit))
; [eval] (let fn$$2 == (fn$$0) in (let fn$$3 == ((tuple3(shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(), v_V0_CN1, shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()): Tuple3[ShStruct3[Ref, Ref, Ref], Int, ShStruct3[Ref, Ref, Ref]])) in (ShStructget0of3(fn$$2): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == (get0of3(fn$$3): ShStruct3[Ref, Ref, Ref]) && ((ShStructget1of3(fn$$2): Ref).Intint$$$$_E_$$$ == (get1of3(fn$$3): Int) && (ShStructget2of3(fn$$2): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == (get2of3(fn$$3): ShStruct3[Ref, Ref, Ref]))))
(declare-const letvar@166@01 ShStruct3<Ref~_Ref~_Ref>)
(assert (= (as letvar@166@01  ShStruct3<Ref~_Ref~_Ref>) fn$$0@164@01))
; [eval] (let fn$$3 == ((tuple3(shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(), v_V0_CN1, shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()): Tuple3[ShStruct3[Ref, Ref, Ref], Int, ShStruct3[Ref, Ref, Ref]])) in (ShStructget0of3(fn$$2): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == (get0of3(fn$$3): ShStruct3[Ref, Ref, Ref]) && ((ShStructget1of3(fn$$2): Ref).Intint$$$$_E_$$$ == (get1of3(fn$$3): Int) && (ShStructget2of3(fn$$2): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == (get2of3(fn$$3): ShStruct3[Ref, Ref, Ref])))
; [eval] (tuple3(shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(), v_V0_CN1, shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()): Tuple3[ShStruct3[Ref, Ref, Ref], Int, ShStruct3[Ref, Ref, Ref]])
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
; Joined path conditions
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 5
(pop) ; 5
; Joined path conditions
(declare-const letvar@167@01 Tuple3<ShStruct3<Ref~_Ref~_Ref>~_Int~_ShStruct3<Ref~_Ref~_Ref>>)
(assert (=
  (as letvar@167@01  Tuple3<ShStruct3<Ref~_Ref~_Ref>~_Int~_ShStruct3<Ref~_Ref~_Ref>>)
  (tuple3<Tuple3<ShStruct3<Ref~_Ref~_Ref>~_Int~_ShStruct3<Ref~_Ref~_Ref>>> (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit) v_V0@109@01 (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
; [eval] (ShStructget0of3(fn$$2): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == (get0of3(fn$$3): ShStruct3[Ref, Ref, Ref]) && ((ShStructget1of3(fn$$2): Ref).Intint$$$$_E_$$$ == (get1of3(fn$$3): Int) && (ShStructget2of3(fn$$2): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == (get2of3(fn$$3): ShStruct3[Ref, Ref, Ref]))
; [eval] (ShStructget0of3(fn$$2): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == (get0of3(fn$$3): ShStruct3[Ref, Ref, Ref])
; [eval] (ShStructget0of3(fn$$2): Ref)
; [eval] (get0of3(fn$$3): ShStruct3[Ref, Ref, Ref])
(push) ; 5
; [then-branch: 337 | First:(First:($t@165@01)) == get0of3[ShStruct3[Ref, Ref, Ref]](tuple3[Tuple3[ShStruct3[Ref, Ref, Ref], Int, ShStruct3[Ref, Ref, Ref]]](shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_), v_V0@109@01, shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_))) | live]
; [else-branch: 337 | First:(First:($t@165@01)) != get0of3[ShStruct3[Ref, Ref, Ref]](tuple3[Tuple3[ShStruct3[Ref, Ref, Ref], Int, ShStruct3[Ref, Ref, Ref]]](shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_), v_V0@109@01, shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_))) | live]
(push) ; 6
; [then-branch: 337 | First:(First:($t@165@01)) == get0of3[ShStruct3[Ref, Ref, Ref]](tuple3[Tuple3[ShStruct3[Ref, Ref, Ref], Int, ShStruct3[Ref, Ref, Ref]]](shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_), v_V0@109@01, shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)))]
(assert (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.first $t@165@01)))
  (get0of3<ShStruct3<Ref~_Ref~_Ref>> (tuple3<Tuple3<ShStruct3<Ref~_Ref~_Ref>~_Int~_ShStruct3<Ref~_Ref~_Ref>>> (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit) v_V0@109@01 (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
; [eval] (ShStructget1of3(fn$$2): Ref).Intint$$$$_E_$$$ == (get1of3(fn$$3): Int)
; [eval] (ShStructget1of3(fn$$2): Ref)
; [eval] (get1of3(fn$$3): Int)
(push) ; 7
; [then-branch: 338 | First:(Second:(First:($t@165@01))) == get1of3[Int](tuple3[Tuple3[ShStruct3[Ref, Ref, Ref], Int, ShStruct3[Ref, Ref, Ref]]](shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_), v_V0@109@01, shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_))) | live]
; [else-branch: 338 | First:(Second:(First:($t@165@01))) != get1of3[Int](tuple3[Tuple3[ShStruct3[Ref, Ref, Ref], Int, ShStruct3[Ref, Ref, Ref]]](shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_), v_V0@109@01, shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_))) | live]
(push) ; 8
; [then-branch: 338 | First:(Second:(First:($t@165@01))) == get1of3[Int](tuple3[Tuple3[ShStruct3[Ref, Ref, Ref], Int, ShStruct3[Ref, Ref, Ref]]](shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_), v_V0@109@01, shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)))]
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@165@01))))
  (get1of3<Int> (tuple3<Tuple3<ShStruct3<Ref~_Ref~_Ref>~_Int~_ShStruct3<Ref~_Ref~_Ref>>> (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit) v_V0@109@01 (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
; [eval] (ShStructget2of3(fn$$2): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == (get2of3(fn$$3): ShStruct3[Ref, Ref, Ref])
; [eval] (ShStructget2of3(fn$$2): Ref)
; [eval] (get2of3(fn$$3): ShStruct3[Ref, Ref, Ref])
(pop) ; 8
(push) ; 8
; [else-branch: 338 | First:(Second:(First:($t@165@01))) != get1of3[Int](tuple3[Tuple3[ShStruct3[Ref, Ref, Ref], Int, ShStruct3[Ref, Ref, Ref]]](shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_), v_V0@109@01, shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)))]
(assert (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@165@01))))
    (get1of3<Int> (tuple3<Tuple3<ShStruct3<Ref~_Ref~_Ref>~_Int~_ShStruct3<Ref~_Ref~_Ref>>> (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit) v_V0@109@01 (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@165@01))))
      (get1of3<Int> (tuple3<Tuple3<ShStruct3<Ref~_Ref~_Ref>~_Int~_ShStruct3<Ref~_Ref~_Ref>>> (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit) v_V0@109@01 (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@165@01))))
    (get1of3<Int> (tuple3<Tuple3<ShStruct3<Ref~_Ref~_Ref>~_Int~_ShStruct3<Ref~_Ref~_Ref>>> (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit) v_V0@109@01 (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))))
(pop) ; 6
(push) ; 6
; [else-branch: 337 | First:(First:($t@165@01)) != get0of3[ShStruct3[Ref, Ref, Ref]](tuple3[Tuple3[ShStruct3[Ref, Ref, Ref], Int, ShStruct3[Ref, Ref, Ref]]](shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_), v_V0@109@01, shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)))]
(assert (not
  (=
    ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.first $t@165@01)))
    (get0of3<ShStruct3<Ref~_Ref~_Ref>> (tuple3<Tuple3<ShStruct3<Ref~_Ref~_Ref>~_Int~_ShStruct3<Ref~_Ref~_Ref>>> (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit) v_V0@109@01 (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (=
    ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.first $t@165@01)))
    (get0of3<ShStruct3<Ref~_Ref~_Ref>> (tuple3<Tuple3<ShStruct3<Ref~_Ref~_Ref>~_Int~_ShStruct3<Ref~_Ref~_Ref>>> (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit) v_V0@109@01 (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
  (and
    (=
      ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.first $t@165@01)))
      (get0of3<ShStruct3<Ref~_Ref~_Ref>> (tuple3<Tuple3<ShStruct3<Ref~_Ref~_Ref>~_Int~_ShStruct3<Ref~_Ref~_Ref>>> (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit) v_V0@109@01 (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
    (or
      (not
        (=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@165@01))))
          (get1of3<Int> (tuple3<Tuple3<ShStruct3<Ref~_Ref~_Ref>~_Int~_ShStruct3<Ref~_Ref~_Ref>>> (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit) v_V0@109@01 (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
      (=
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@165@01))))
        (get1of3<Int> (tuple3<Tuple3<ShStruct3<Ref~_Ref~_Ref>~_Int~_ShStruct3<Ref~_Ref~_Ref>>> (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit) v_V0@109@01 (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))))))
; Joined path conditions
(assert (or
  (not
    (=
      ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.first $t@165@01)))
      (get0of3<ShStruct3<Ref~_Ref~_Ref>> (tuple3<Tuple3<ShStruct3<Ref~_Ref~_Ref>~_Int~_ShStruct3<Ref~_Ref~_Ref>>> (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit) v_V0@109@01 (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
  (=
    ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.first $t@165@01)))
    (get0of3<ShStruct3<Ref~_Ref~_Ref>> (tuple3<Tuple3<ShStruct3<Ref~_Ref~_Ref>~_Int~_ShStruct3<Ref~_Ref~_Ref>>> (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit) v_V0@109@01 (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))))
(assert (and
  (and
    (=
      ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.second ($Snap.second ($Snap.first $t@165@01))))
      (get2of3<ShStruct3<Ref~_Ref~_Ref>> (tuple3<Tuple3<ShStruct3<Ref~_Ref~_Ref>~_Int~_ShStruct3<Ref~_Ref~_Ref>>> (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit) v_V0@109@01 (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@165@01))))
      (get1of3<Int> (tuple3<Tuple3<ShStruct3<Ref~_Ref~_Ref>~_Int~_ShStruct3<Ref~_Ref~_Ref>>> (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit) v_V0@109@01 (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
  (=
    ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.first $t@165@01)))
    (get0of3<ShStruct3<Ref~_Ref~_Ref>> (tuple3<Tuple3<ShStruct3<Ref~_Ref~_Ref>~_Int~_ShStruct3<Ref~_Ref~_Ref>>> (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit) v_V0@109@01 (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; N6 := fn$$0
; [exec]
; res_V0_CN2 := N6
; [exec]
; fold acc(tree_8a1a376e_F(res_V0_CN2), write)
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] (ShStructget1of3(self_V0): Ref)
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] !((ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.first $t@165@01)))
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 339 | First:(First:($t@165@01)) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 339 | First:(First:($t@165@01)) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 339 | First:(First:($t@165@01)) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.first $t@165@01)))
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
; [eval] !((ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.second ($Snap.second ($Snap.first $t@165@01))))
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 340 | Second:(Second:(First:($t@165@01))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 340 | Second:(Second:(First:($t@165@01))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 340 | Second:(Second:(First:($t@165@01))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.second ($Snap.second ($Snap.first $t@165@01))))
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (tree_8a1a376e_F%trigger ($Snap.combine
  ($Snap.first ($Snap.first $t@165@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@165@01)))
    ($Snap.combine
      ($Snap.second ($Snap.second ($Snap.first $t@165@01)))
      ($Snap.combine $Snap.unit $Snap.unit)))) fn$$0@164@01))
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 7
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 8
(pop) ; 8
; Joined path conditions
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  fn$$0@164@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    fn$$0@164@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 341 | fn$$0@164@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 341 | fn$$0@164@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 341 | fn$$0@164@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    fn$$0@164@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.combine
  ($Snap.first ($Snap.first $t@165@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@165@01)))
    ($Snap.combine
      ($Snap.second ($Snap.second ($Snap.first $t@165@01)))
      ($Snap.combine $Snap.unit $Snap.unit)))) fn$$0@164@01 v_V0@109@01))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (not
    (=
      fn$$0@164@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (and
    (not
      (=
        fn$$0@164@01
        (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
    (Contains_8a1a376e_PMTree%precondition ($Snap.combine
      ($Snap.first ($Snap.first $t@165@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@165@01)))
        ($Snap.combine
          ($Snap.second ($Snap.second ($Snap.first $t@165@01)))
          ($Snap.combine $Snap.unit $Snap.unit)))) fn$$0@164@01 v_V0@109@01))))
(assert (not
  (=
    fn$$0@164@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(push) ; 7
(assert (not (Contains_8a1a376e_PMTree ($Snap.combine
  ($Snap.first ($Snap.first $t@165@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@165@01)))
    ($Snap.combine
      ($Snap.second ($Snap.second ($Snap.first $t@165@01)))
      ($Snap.combine $Snap.unit $Snap.unit)))) fn$$0@164@01 v_V0@109@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (Contains_8a1a376e_PMTree ($Snap.combine
  ($Snap.first ($Snap.first $t@165@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@165@01)))
    ($Snap.combine
      ($Snap.second ($Snap.second ($Snap.first $t@165@01)))
      ($Snap.combine $Snap.unit $Snap.unit)))) fn$$0@164@01 v_V0@109@01))
(pop) ; 6
(pop) ; 5
(pop) ; 4
; [eval] !(self_V0_CN0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0_CN0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 4
(pop) ; 4
; Joined path conditions
; [then-branch: 342 | self_V0@108@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 342 | self_V0@108@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 4
; [else-branch: 342 | self_V0@108@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- deleteLeftMost_8a1a376e_PMTree ----------
(declare-const self_V0@168@01 ShStruct3<Ref~_Ref~_Ref>)
(declare-const v_V0@169@01 Int)
(declare-const res_V0@170@01 ShStruct3<Ref~_Ref~_Ref>)
(declare-const leftMost_V0@171@01 Int)
(declare-const self_V0@172@01 ShStruct3<Ref~_Ref~_Ref>)
(declare-const v_V0@173@01 Int)
(declare-const res_V0@174@01 ShStruct3<Ref~_Ref~_Ref>)
(declare-const leftMost_V0@175@01 Int)
(push) ; 1
(declare-const $t@176@01 $Snap)
(assert (= $t@176@01 ($Snap.combine ($Snap.first $t@176@01) ($Snap.second $t@176@01))))
(assert (= ($Snap.second $t@176@01) $Snap.unit))
; [eval] !Contains_8a1a376e_PMTree(self_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(self_V0, v_V0)
(push) ; 2
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 3
(assert (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$%precondition $Snap.unit))
(pop) ; 3
; Joined path conditions
(assert (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$%precondition $Snap.unit))
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  self_V0@172@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    self_V0@172@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [then-branch: 343 | self_V0@172@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 343 | self_V0@172@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 343 | self_V0@172@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    self_V0@172@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@176@01) self_V0@172@01 v_V0@173@01))
(pop) ; 3
(push) ; 3
; [else-branch: 343 | self_V0@172@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  self_V0@172@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (Contains_8a1a376e_PMTree%precondition $Snap.unit self_V0@172@01 v_V0@173@01))
(pop) ; 3
(pop) ; 2
(declare-fun joined_Contains_8a1a376e_PMTree@177@01 (ShStruct3<Ref~_Ref~_Ref> Int) Bool)
(assert (=>
  (not
    (=
      self_V0@172@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (=
    (joined_Contains_8a1a376e_PMTree@177@01 self_V0@172@01 v_V0@173@01)
    (Contains_8a1a376e_PMTree ($Snap.first $t@176@01) self_V0@172@01 v_V0@173@01))))
(assert (=>
  (=
    self_V0@172@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (=
    (joined_Contains_8a1a376e_PMTree@177@01 self_V0@172@01 v_V0@173@01)
    (Contains_8a1a376e_PMTree $Snap.unit self_V0@172@01 v_V0@173@01))))
; Joined path conditions
(assert (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$%precondition $Snap.unit))
(assert (=>
  (not
    (=
      self_V0@172@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (and
    (not
      (=
        self_V0@172@01
        (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
    (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@176@01) self_V0@172@01 v_V0@173@01))))
; Joined path conditions
(assert (=>
  (=
    self_V0@172@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (and
    (=
      self_V0@172@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
    (Contains_8a1a376e_PMTree%precondition $Snap.unit self_V0@172@01 v_V0@173@01))))
(assert (or
  (=
    self_V0@172@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (not
    (=
      self_V0@172@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(assert (not (joined_Contains_8a1a376e_PMTree@177@01 self_V0@172@01 v_V0@173@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@178@01 $Snap)
(assert (= $t@178@01 ($Snap.combine ($Snap.first $t@178@01) ($Snap.second $t@178@01))))
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  res_V0@174@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@174@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [then-branch: 344 | res_V0@174@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 344 | res_V0@174@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 344 | res_V0@174@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    res_V0@174@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(assert (=
  ($Snap.second $t@178@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@178@01))
    ($Snap.second ($Snap.second $t@178@01)))))
(assert (= ($Snap.first ($Snap.second $t@178@01)) $Snap.unit))
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 4
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  res_V0@174@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 345 | res_V0@174@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 345 | res_V0@174@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 345 | res_V0@174@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@178@01) res_V0@174@01 v_V0@173@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (not
    (=
      res_V0@174@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@178@01) res_V0@174@01 v_V0@173@01)))
(assert (not
  (Contains_8a1a376e_PMTree ($Snap.first $t@178@01) res_V0@174@01 v_V0@173@01)))
(assert (= ($Snap.second ($Snap.second $t@178@01)) $Snap.unit))
; [eval] !(v_V0 == leftMost_V0)
; [eval] v_V0 == leftMost_V0
(assert (not (= v_V0@173@01 leftMost_V0@175@01)))
(pop) ; 3
(push) ; 3
; [else-branch: 344 | res_V0@174@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  res_V0@174@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (= ($Snap.first $t@178@01) $Snap.unit))
(assert (=
  ($Snap.second $t@178@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@178@01))
    ($Snap.second ($Snap.second $t@178@01)))))
(assert (= ($Snap.first ($Snap.second $t@178@01)) $Snap.unit))
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 4
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 5
(pop) ; 5
; Joined path conditions
; [then-branch: 346 | res_V0@174@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 346 | res_V0@174@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 5
; [else-branch: 346 | res_V0@174@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@174@01 v_V0@173@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (=
    res_V0@174@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@174@01 v_V0@173@01)))
(assert (not (Contains_8a1a376e_PMTree $Snap.unit res_V0@174@01 v_V0@173@01)))
(assert (= ($Snap.second ($Snap.second $t@178@01)) $Snap.unit))
; [eval] !(v_V0 == leftMost_V0)
; [eval] v_V0 == leftMost_V0
(assert (not (= v_V0@173@01 leftMost_V0@175@01)))
(pop) ; 3
(pop) ; 2
(push) ; 2
; [exec]
; var leftMost_V0_CN3: Int
(declare-const leftMost_V0_CN3@179@01 Int)
; [exec]
; var res_V0_CN2: ShStruct3[Ref, Ref, Ref]
(declare-const res_V0_CN2@180@01 ShStruct3<Ref~_Ref~_Ref>)
; [exec]
; var v_V0_CN1: Int
(declare-const v_V0_CN1@181@01 Int)
; [exec]
; var self_V0_CN0: ShStruct3[Ref, Ref, Ref]
(declare-const self_V0_CN0@182@01 ShStruct3<Ref~_Ref~_Ref>)
; [exec]
; inhale res_V0 ==
;   shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(declare-const $t@183@01 $Snap)
(assert (= $t@183@01 $Snap.unit))
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 3
(pop) ; 3
; Joined path conditions
(assert (=
  res_V0@174@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale leftMost_V0 == 0
(declare-const $t@184@01 $Snap)
(assert (= $t@184@01 $Snap.unit))
; [eval] leftMost_V0 == 0
(assert (= leftMost_V0@175@01 0))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale self_V0_CN0 ==
;   shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(declare-const $t@185@01 $Snap)
(assert (= $t@185@01 $Snap.unit))
; [eval] self_V0_CN0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(assert (=
  self_V0_CN0@182@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale v_V0_CN1 == 0
(declare-const $t@186@01 $Snap)
(assert (= $t@186@01 $Snap.unit))
; [eval] v_V0_CN1 == 0
(assert (= v_V0_CN1@181@01 0))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale res_V0_CN2 ==
;   shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(declare-const $t@187@01 $Snap)
(assert (= $t@187@01 $Snap.unit))
; [eval] res_V0_CN2 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(assert (=
  res_V0_CN2@180@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale leftMost_V0_CN3 == 0
(declare-const $t@188@01 $Snap)
(assert (= $t@188@01 $Snap.unit))
; [eval] leftMost_V0_CN3 == 0
(assert (= leftMost_V0_CN3@179@01 0))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; self_V0_CN0 := self_V0
; [exec]
; v_V0_CN1 := v_V0
; [exec]
; unfold acc(tree_8a1a376e_F(self_V0_CN0), write)
(assert (=
  ($Snap.first $t@176@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@176@01))
    ($Snap.second ($Snap.first $t@176@01)))))
; [eval] (ShStructget0of3(self_V0): Ref)
(assert (not (= (ShStructget0of3<Ref> self_V0@172@01) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first $t@176@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@176@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@176@01))))))
; [eval] (ShStructget1of3(self_V0): Ref)
(assert (not (= (ShStructget1of3<Ref> self_V0@172@01) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@176@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@176@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@176@01)))))))
; [eval] (ShStructget2of3(self_V0): Ref)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (ShStructget0of3<Ref> self_V0@172@01) (ShStructget2of3<Ref> self_V0@172@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (not (= (ShStructget2of3<Ref> self_V0@172@01) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@176@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@176@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@176@01))))))))
; [eval] !((ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.first $t@176@01)))
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.first $t@176@01)))
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [then-branch: 347 | First:(First:($t@176@01)) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 347 | First:(First:($t@176@01)) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 347 | First:(First:($t@176@01)) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.first $t@176@01)))
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] !((ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@176@01)))))
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@176@01)))))
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 348 | First:(Second:(Second:(First:($t@176@01)))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 348 | First:(Second:(Second:(First:($t@176@01)))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 348 | First:(Second:(Second:(First:($t@176@01)))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@176@01)))))
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
; [eval] (ShStructget2of3(self_V0): Ref)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.first $t@176@01)))
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@176@01))))))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (tree_8a1a376e_F%trigger ($Snap.first $t@176@01) self_V0@172@01))
; [eval] !((ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.first $t@176@01)))
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 349 | First:(First:($t@176@01)) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 349 | First:(First:($t@176@01)) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 349 | First:(First:($t@176@01)) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [exec]
; var N11: Int
(declare-const N11@189@01 Int)
; [exec]
; var N10: ShStruct3[Ref, Ref, Ref]
(declare-const N10@190@01 ShStruct3<Ref~_Ref~_Ref>)
; [exec]
; N10, N11 := deleteLeftMost_8a1a376e_PMTree((ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$,
;   v_V0_CN1)
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
; [eval] !Contains_8a1a376e_PMTree(self_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(self_V0, v_V0)
(push) ; 6
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.first $t@176@01)))
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 350 | First:(First:($t@176@01)) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 350 | First:(First:($t@176@01)) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 350 | First:(First:($t@176@01)) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@176@01))))) ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.first $t@176@01))) v_V0@173@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.first $t@176@01)))
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@176@01))))) ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.first $t@176@01))) v_V0@173@01)))
(push) ; 6
(assert (not (not
  (Contains_8a1a376e_PMTree ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@176@01))))) ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.first $t@176@01))) v_V0@173@01))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (not
  (Contains_8a1a376e_PMTree ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@176@01))))) ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.first $t@176@01))) v_V0@173@01)))
(declare-const res_V0@191@01 ShStruct3<Ref~_Ref~_Ref>)
(declare-const leftMost_V0@192@01 Int)
(declare-const $t@193@01 $Snap)
(assert (= $t@193@01 ($Snap.combine ($Snap.first $t@193@01) ($Snap.second $t@193@01))))
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  res_V0@191@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@191@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 351 | res_V0@191@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 351 | res_V0@191@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 351 | res_V0@191@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    res_V0@191@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@176@01)))))
  res_V0@191@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@193@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@193@01))
    ($Snap.second ($Snap.second $t@193@01)))))
(assert (= ($Snap.first ($Snap.second $t@193@01)) $Snap.unit))
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(set-option :timeout 0)
(push) ; 7
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 8
(pop) ; 8
; Joined path conditions
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  res_V0@191@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 352 | res_V0@191@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 352 | res_V0@191@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 352 | res_V0@191@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@193@01) res_V0@191@01 v_V0@173@01))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (not
    (=
      res_V0@191@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@193@01) res_V0@191@01 v_V0@173@01)))
(assert (not
  (Contains_8a1a376e_PMTree ($Snap.first $t@193@01) res_V0@191@01 v_V0@173@01)))
(assert (= ($Snap.second ($Snap.second $t@193@01)) $Snap.unit))
; [eval] !(v_V0 == leftMost_V0)
; [eval] v_V0 == leftMost_V0
(assert (not (= v_V0@173@01 leftMost_V0@192@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; (ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := N10
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (ShStructget2of3<Ref> self_V0@172@01) (ShStructget0of3<Ref> self_V0@172@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; leftMost_V0_CN3 := N11
; [exec]
; fold acc(tree_8a1a376e_F(self_V0_CN0), write)
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] (ShStructget1of3(self_V0): Ref)
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] !((ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  res_V0@191@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 353 | res_V0@191@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 353 | res_V0@191@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 353 | res_V0@191@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] !((ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 8
(pop) ; 8
; Joined path conditions
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@176@01)))))
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 354 | First:(Second:(Second:(First:($t@176@01)))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 354 | First:(Second:(Second:(First:($t@176@01)))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 354 | First:(Second:(Second:(First:($t@176@01)))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] (ShStructget2of3(self_V0): Ref)
(assert (tree_8a1a376e_F%trigger ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@191@01)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@176@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@176@01))))
      ($Snap.combine
        ($Snap.first $t@193@01)
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@176@01))))))))) self_V0@172@01))
; [exec]
; res_V0_CN2 := self_V0_CN0
; [exec]
; res_V0_CN2 := res_V0_CN2
; [exec]
; leftMost_V0_CN3 := leftMost_V0_CN3
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [exec]
; leftMost_V0 := leftMost_V0_CN3
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  self_V0@172@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    self_V0@172@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 355 | self_V0@172@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 355 | self_V0@172@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 355 | self_V0@172@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    self_V0@172@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 10
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 11
(pop) ; 11
; Joined path conditions
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  self_V0@172@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 356 | self_V0@172@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 356 | self_V0@172@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 356 | self_V0@172@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@191@01)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@176@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@176@01))))
      ($Snap.combine
        ($Snap.first $t@193@01)
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@176@01))))))))) self_V0@172@01 v_V0@173@01))
(pop) ; 11
(pop) ; 10
; Joined path conditions
(assert (=>
  (not
    (=
      self_V0@172@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@191@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@176@01)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@176@01))))
        ($Snap.combine
          ($Snap.first $t@193@01)
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@176@01))))))))) self_V0@172@01 v_V0@173@01)))
(push) ; 10
(assert (not (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@191@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@176@01)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@176@01))))
        ($Snap.combine
          ($Snap.first $t@193@01)
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@176@01))))))))) self_V0@172@01 v_V0@173@01))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@191@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@176@01)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@176@01))))
        ($Snap.combine
          ($Snap.first $t@193@01)
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@176@01))))))))) self_V0@172@01 v_V0@173@01)))
; [eval] !(v_V0 == leftMost_V0)
; [eval] v_V0 == leftMost_V0
(pop) ; 9
(pop) ; 8
(pop) ; 7
(pop) ; 6
(push) ; 6
; [else-branch: 351 | res_V0@191@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  res_V0@191@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (= ($Snap.first $t@193@01) $Snap.unit))
(assert (=
  ($Snap.second $t@193@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@193@01))
    ($Snap.second ($Snap.second $t@193@01)))))
(assert (= ($Snap.first ($Snap.second $t@193@01)) $Snap.unit))
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 7
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 8
(pop) ; 8
; Joined path conditions
; [then-branch: 357 | res_V0@191@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 357 | res_V0@191@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 8
; [else-branch: 357 | res_V0@191@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@191@01 v_V0@173@01))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (=
    res_V0@191@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@191@01 v_V0@173@01)))
(assert (not (Contains_8a1a376e_PMTree $Snap.unit res_V0@191@01 v_V0@173@01)))
(assert (= ($Snap.second ($Snap.second $t@193@01)) $Snap.unit))
; [eval] !(v_V0 == leftMost_V0)
; [eval] v_V0 == leftMost_V0
(assert (not (= v_V0@173@01 leftMost_V0@192@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; (ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := N10
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (ShStructget2of3<Ref> self_V0@172@01) (ShStructget0of3<Ref> self_V0@172@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; leftMost_V0_CN3 := N11
; [exec]
; fold acc(tree_8a1a376e_F(self_V0_CN0), write)
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] (ShStructget1of3(self_V0): Ref)
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] !((ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 7
(pop) ; 7
; Joined path conditions
; [then-branch: 358 | res_V0@191@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 358 | res_V0@191@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 7
; [else-branch: 358 | res_V0@191@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !((ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 8
(pop) ; 8
; Joined path conditions
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@176@01)))))
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 359 | First:(Second:(Second:(First:($t@176@01)))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 359 | First:(Second:(Second:(First:($t@176@01)))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 359 | First:(Second:(Second:(First:($t@176@01)))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] (ShStructget2of3(self_V0): Ref)
(assert (tree_8a1a376e_F%trigger ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@191@01)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@176@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@176@01))))
      ($Snap.combine
        $Snap.unit
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@176@01))))))))) self_V0@172@01))
; [exec]
; res_V0_CN2 := self_V0_CN0
; [exec]
; res_V0_CN2 := res_V0_CN2
; [exec]
; leftMost_V0_CN3 := leftMost_V0_CN3
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [exec]
; leftMost_V0 := leftMost_V0_CN3
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  self_V0@172@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    self_V0@172@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 360 | self_V0@172@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 360 | self_V0@172@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 360 | self_V0@172@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    self_V0@172@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 10
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 11
(pop) ; 11
; Joined path conditions
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  self_V0@172@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 361 | self_V0@172@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 361 | self_V0@172@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 361 | self_V0@172@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@191@01)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@176@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@176@01))))
      ($Snap.combine
        $Snap.unit
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@176@01))))))))) self_V0@172@01 v_V0@173@01))
(pop) ; 11
(pop) ; 10
; Joined path conditions
(assert (=>
  (not
    (=
      self_V0@172@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@191@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@176@01)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@176@01))))
        ($Snap.combine
          $Snap.unit
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@176@01))))))))) self_V0@172@01 v_V0@173@01)))
(push) ; 10
(assert (not (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@191@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@176@01)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@176@01))))
        ($Snap.combine
          $Snap.unit
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@176@01))))))))) self_V0@172@01 v_V0@173@01))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@191@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@176@01)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@176@01))))
        ($Snap.combine
          $Snap.unit
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@176@01))))))))) self_V0@172@01 v_V0@173@01)))
; [eval] !(v_V0 == leftMost_V0)
; [eval] v_V0 == leftMost_V0
(pop) ; 9
(pop) ; 8
(pop) ; 7
(pop) ; 6
(pop) ; 5
; [eval] !!((ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] !((ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 5
(pop) ; 5
; Joined path conditions
; [then-branch: 362 | First:(First:($t@176@01)) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 362 | First:(First:($t@176@01)) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 5
; [else-branch: 362 | First:(First:($t@176@01)) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 348 | First:(Second:(Second:(First:($t@176@01)))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@176@01)))))
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@176@01)))))
  $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (tree_8a1a376e_F%trigger ($Snap.first $t@176@01) self_V0@172@01))
; [eval] !((ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.first $t@176@01)))
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 363 | First:(First:($t@176@01)) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 363 | First:(First:($t@176@01)) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 363 | First:(First:($t@176@01)) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [exec]
; var N11: Int
(declare-const N11@194@01 Int)
; [exec]
; var N10: ShStruct3[Ref, Ref, Ref]
(declare-const N10@195@01 ShStruct3<Ref~_Ref~_Ref>)
; [exec]
; N10, N11 := deleteLeftMost_8a1a376e_PMTree((ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$,
;   v_V0_CN1)
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
; [eval] !Contains_8a1a376e_PMTree(self_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(self_V0, v_V0)
(push) ; 6
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.first $t@176@01)))
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 364 | First:(First:($t@176@01)) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 364 | First:(First:($t@176@01)) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 364 | First:(First:($t@176@01)) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@176@01))))) ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.first $t@176@01))) v_V0@173@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.first $t@176@01)))
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@176@01))))) ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.first $t@176@01))) v_V0@173@01)))
(push) ; 6
(assert (not (not
  (Contains_8a1a376e_PMTree ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@176@01))))) ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.first $t@176@01))) v_V0@173@01))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (not
  (Contains_8a1a376e_PMTree ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@176@01))))) ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.first $t@176@01))) v_V0@173@01)))
(declare-const res_V0@196@01 ShStruct3<Ref~_Ref~_Ref>)
(declare-const leftMost_V0@197@01 Int)
(declare-const $t@198@01 $Snap)
(assert (= $t@198@01 ($Snap.combine ($Snap.first $t@198@01) ($Snap.second $t@198@01))))
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  res_V0@196@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not
  (=
    res_V0@196@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 365 | res_V0@196@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 365 | res_V0@196@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 365 | res_V0@196@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    res_V0@196@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(assert (=
  ($Snap.second $t@198@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@198@01))
    ($Snap.second ($Snap.second $t@198@01)))))
(assert (= ($Snap.first ($Snap.second $t@198@01)) $Snap.unit))
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 7
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 8
(pop) ; 8
; Joined path conditions
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  res_V0@196@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 366 | res_V0@196@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 366 | res_V0@196@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 366 | res_V0@196@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@198@01) res_V0@196@01 v_V0@173@01))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (not
    (=
      res_V0@196@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.first $t@198@01) res_V0@196@01 v_V0@173@01)))
(assert (not
  (Contains_8a1a376e_PMTree ($Snap.first $t@198@01) res_V0@196@01 v_V0@173@01)))
(assert (= ($Snap.second ($Snap.second $t@198@01)) $Snap.unit))
; [eval] !(v_V0 == leftMost_V0)
; [eval] v_V0 == leftMost_V0
(assert (not (= v_V0@173@01 leftMost_V0@197@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; (ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := N10
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (ShStructget2of3<Ref> self_V0@172@01) (ShStructget0of3<Ref> self_V0@172@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; leftMost_V0_CN3 := N11
; [exec]
; fold acc(tree_8a1a376e_F(self_V0_CN0), write)
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] (ShStructget1of3(self_V0): Ref)
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] !((ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  res_V0@196@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 367 | res_V0@196@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 367 | res_V0@196@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 367 | res_V0@196@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] !((ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 8
(pop) ; 8
; Joined path conditions
; [then-branch: 368 | First:(Second:(Second:(First:($t@176@01)))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 368 | First:(Second:(Second:(First:($t@176@01)))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 8
; [else-branch: 368 | First:(Second:(Second:(First:($t@176@01)))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (tree_8a1a376e_F%trigger ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@196@01)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@176@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@176@01))))
      ($Snap.combine ($Snap.first $t@198@01) $Snap.unit)))) self_V0@172@01))
; [exec]
; res_V0_CN2 := self_V0_CN0
; [exec]
; res_V0_CN2 := res_V0_CN2
; [exec]
; leftMost_V0_CN3 := leftMost_V0_CN3
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [exec]
; leftMost_V0 := leftMost_V0_CN3
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  self_V0@172@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    self_V0@172@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 369 | self_V0@172@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 369 | self_V0@172@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 369 | self_V0@172@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    self_V0@172@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 10
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 11
(pop) ; 11
; Joined path conditions
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  self_V0@172@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 370 | self_V0@172@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 370 | self_V0@172@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 370 | self_V0@172@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@196@01)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@176@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@176@01))))
      ($Snap.combine ($Snap.first $t@198@01) $Snap.unit)))) self_V0@172@01 v_V0@173@01))
(pop) ; 11
(pop) ; 10
; Joined path conditions
(assert (=>
  (not
    (=
      self_V0@172@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@196@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@176@01)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@176@01))))
        ($Snap.combine ($Snap.first $t@198@01) $Snap.unit)))) self_V0@172@01 v_V0@173@01)))
(push) ; 10
(assert (not (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@196@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@176@01)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@176@01))))
        ($Snap.combine ($Snap.first $t@198@01) $Snap.unit)))) self_V0@172@01 v_V0@173@01))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@196@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@176@01)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@176@01))))
        ($Snap.combine ($Snap.first $t@198@01) $Snap.unit)))) self_V0@172@01 v_V0@173@01)))
; [eval] !(v_V0 == leftMost_V0)
; [eval] v_V0 == leftMost_V0
(pop) ; 9
(pop) ; 8
(pop) ; 7
(pop) ; 6
(push) ; 6
; [else-branch: 365 | res_V0@196@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  res_V0@196@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (= ($Snap.first $t@198@01) $Snap.unit))
(assert (=
  ($Snap.second $t@198@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@198@01))
    ($Snap.second ($Snap.second $t@198@01)))))
(assert (= ($Snap.first ($Snap.second $t@198@01)) $Snap.unit))
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 7
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 8
(pop) ; 8
; Joined path conditions
; [then-branch: 371 | res_V0@196@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 371 | res_V0@196@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 8
; [else-branch: 371 | res_V0@196@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@196@01 v_V0@173@01))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (=
    res_V0@196@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (Contains_8a1a376e_PMTree%precondition $Snap.unit res_V0@196@01 v_V0@173@01)))
(assert (not (Contains_8a1a376e_PMTree $Snap.unit res_V0@196@01 v_V0@173@01)))
(assert (= ($Snap.second ($Snap.second $t@198@01)) $Snap.unit))
; [eval] !(v_V0 == leftMost_V0)
; [eval] v_V0 == leftMost_V0
(assert (not (= v_V0@173@01 leftMost_V0@197@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; (ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ := N10
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (ShStructget2of3<Ref> self_V0@172@01) (ShStructget0of3<Ref> self_V0@172@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; leftMost_V0_CN3 := N11
; [exec]
; fold acc(tree_8a1a376e_F(self_V0_CN0), write)
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] (ShStructget1of3(self_V0): Ref)
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] !((ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 7
(pop) ; 7
; Joined path conditions
; [then-branch: 372 | res_V0@196@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 372 | res_V0@196@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 7
; [else-branch: 372 | res_V0@196@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !((ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 8
(pop) ; 8
; Joined path conditions
; [then-branch: 373 | First:(Second:(Second:(First:($t@176@01)))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 373 | First:(Second:(Second:(First:($t@176@01)))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 8
; [else-branch: 373 | First:(Second:(Second:(First:($t@176@01)))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (tree_8a1a376e_F%trigger ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@196@01)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@176@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@176@01))))
      ($Snap.combine $Snap.unit $Snap.unit)))) self_V0@172@01))
; [exec]
; res_V0_CN2 := self_V0_CN0
; [exec]
; res_V0_CN2 := res_V0_CN2
; [exec]
; leftMost_V0_CN3 := leftMost_V0_CN3
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [exec]
; leftMost_V0 := leftMost_V0_CN3
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  self_V0@172@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    self_V0@172@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 374 | self_V0@172@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 374 | self_V0@172@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 374 | self_V0@172@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    self_V0@172@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 10
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 11
(pop) ; 11
; Joined path conditions
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  self_V0@172@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 375 | self_V0@172@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 375 | self_V0@172@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 375 | self_V0@172@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.combine
  ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@196@01)
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@176@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@176@01))))
      ($Snap.combine $Snap.unit $Snap.unit)))) self_V0@172@01 v_V0@173@01))
(pop) ; 11
(pop) ; 10
; Joined path conditions
(assert (=>
  (not
    (=
      self_V0@172@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@196@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@176@01)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@176@01))))
        ($Snap.combine $Snap.unit $Snap.unit)))) self_V0@172@01 v_V0@173@01)))
(push) ; 10
(assert (not (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@196@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@176@01)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@176@01))))
        ($Snap.combine $Snap.unit $Snap.unit)))) self_V0@172@01 v_V0@173@01))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (not
  (Contains_8a1a376e_PMTree ($Snap.combine
    ($SortWrappers.ShStruct3<Ref~_Ref~_Ref>To$Snap res_V0@196@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@176@01)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@176@01))))
        ($Snap.combine $Snap.unit $Snap.unit)))) self_V0@172@01 v_V0@173@01)))
; [eval] !(v_V0 == leftMost_V0)
; [eval] v_V0 == leftMost_V0
(pop) ; 9
(pop) ; 8
(pop) ; 7
(pop) ; 6
(pop) ; 5
; [eval] !!((ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] !((ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 5
(pop) ; 5
; Joined path conditions
; [then-branch: 376 | First:(First:($t@176@01)) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 376 | First:(First:($t@176@01)) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 5
; [else-branch: 376 | First:(First:($t@176@01)) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(pop) ; 5
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 347 | First:(First:($t@176@01)) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.first $t@176@01)))
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@176@01)))))
  $Snap.unit))
; [eval] !((ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget2of3(self_V0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget2of3(self_V0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@176@01)))))
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@176@01)))))
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 377 | First:(Second:(Second:(First:($t@176@01)))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 377 | First:(Second:(Second:(First:($t@176@01)))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 377 | First:(Second:(Second:(First:($t@176@01)))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@176@01)))))
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
; [eval] (ShStructget2of3(self_V0): Ref)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (tree_8a1a376e_F%trigger ($Snap.first $t@176@01) self_V0@172@01))
; [eval] !((ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
; Joined path conditions
; [then-branch: 378 | First:(First:($t@176@01)) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 378 | First:(First:($t@176@01)) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 5
; [else-branch: 378 | First:(First:($t@176@01)) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(pop) ; 5
; [eval] !!((ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] !((ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.first $t@176@01)))
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 379 | First:(First:($t@176@01)) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 379 | First:(First:($t@176@01)) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 379 | First:(First:($t@176@01)) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !((ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget2of3(self_V0_CN0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@176@01)))))
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 380 | First:(Second:(Second:(First:($t@176@01)))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 380 | First:(Second:(Second:(First:($t@176@01)))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 380 | First:(Second:(Second:(First:($t@176@01)))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [exec]
; var N9: Int
(declare-const N9@199@01 Int)
; [exec]
; var N8: ShStruct3[Ref, Ref, Ref]
(declare-const N8@200@01 ShStruct3<Ref~_Ref~_Ref>)
; [exec]
; N8 := (ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$
; [eval] (ShStructget2of3(self_V0_CN0): Ref)
(declare-const N8@201@01 ShStruct3<Ref~_Ref~_Ref>)
(assert (=
  N8@201@01
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@176@01)))))))
; [exec]
; N9 := (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
(declare-const N9@202@01 Int)
(assert (=
  N9@202@01
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@176@01))))))
; [exec]
; res_V0_CN2 := N8
; [exec]
; leftMost_V0_CN3 := N9
; [exec]
; res_V0_CN2 := res_V0_CN2
; [exec]
; leftMost_V0_CN3 := leftMost_V0_CN3
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [exec]
; leftMost_V0 := leftMost_V0_CN3
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  N8@201@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    N8@201@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 381 | N8@201@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 381 | N8@201@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 381 | N8@201@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    N8@201@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@176@01)))))
  N8@201@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(set-option :timeout 0)
(push) ; 8
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  N8@201@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 382 | N8@201@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 382 | N8@201@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 382 | N8@201@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@176@01)))))
  N8@201@01)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (Contains_8a1a376e_PMTree%precondition ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@176@01))))) N8@201@01 v_V0@173@01))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (not
    (=
      N8@201@01
      (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (Contains_8a1a376e_PMTree%precondition ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@176@01))))) N8@201@01 v_V0@173@01)))
(set-option :timeout 0)
(push) ; 8
(assert (not (not
  (Contains_8a1a376e_PMTree ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@176@01))))) N8@201@01 v_V0@173@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (not
  (Contains_8a1a376e_PMTree ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@176@01))))) N8@201@01 v_V0@173@01)))
; [eval] !(v_V0 == leftMost_V0)
; [eval] v_V0 == leftMost_V0
(push) ; 8
(assert (not (not (= v_V0@173@01 N9@202@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (not (= v_V0@173@01 N9@202@01)))
(pop) ; 7
(pop) ; 6
; [eval] !!((ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] !((ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget2of3(self_V0_CN0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 6
(pop) ; 6
; Joined path conditions
; [then-branch: 383 | First:(Second:(Second:(First:($t@176@01)))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 383 | First:(Second:(Second:(First:($t@176@01)))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 6
; [else-branch: 383 | First:(Second:(Second:(First:($t@176@01)))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(pop) ; 6
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 377 | First:(Second:(Second:(First:($t@176@01)))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@176@01)))))
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@176@01)))))
  $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (tree_8a1a376e_F%trigger ($Snap.first $t@176@01) self_V0@172@01))
; [eval] !((ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
; Joined path conditions
; [then-branch: 384 | First:(First:($t@176@01)) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 384 | First:(First:($t@176@01)) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 5
; [else-branch: 384 | First:(First:($t@176@01)) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(pop) ; 5
; [eval] !!((ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] !((ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget0of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget0of3(self_V0_CN0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.first $t@176@01)))
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 385 | First:(First:($t@176@01)) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 385 | First:(First:($t@176@01)) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 385 | First:(First:($t@176@01)) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !((ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget2of3(self_V0_CN0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 6
(pop) ; 6
; Joined path conditions
; [then-branch: 386 | First:(Second:(Second:(First:($t@176@01)))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 386 | First:(Second:(Second:(First:($t@176@01)))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 6
; [else-branch: 386 | First:(Second:(Second:(First:($t@176@01)))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(pop) ; 6
; [eval] !!((ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] !((ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget2of3(self_V0_CN0): Ref).PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget2of3(self_V0_CN0): Ref)
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToShStruct3<Ref~_Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@176@01)))))
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 387 | First:(Second:(Second:(First:($t@176@01)))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 387 | First:(Second:(Second:(First:($t@176@01)))) != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 387 | First:(Second:(Second:(First:($t@176@01)))) == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [exec]
; var N7: Int
(declare-const N7@203@01 Int)
; [exec]
; var N6: ShStruct3[Ref, Ref, Ref]
(declare-const N6@204@01 ShStruct3<Ref~_Ref~_Ref>)
; [exec]
; N6 := shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 7
(pop) ; 7
; Joined path conditions
(declare-const N6@205@01 ShStruct3<Ref~_Ref~_Ref>)
(assert (=
  N6@205@01
  (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
; [exec]
; N7 := (ShStructget1of3(self_V0_CN0): Ref).Intint$$$$_E_$$$
; [eval] (ShStructget1of3(self_V0_CN0): Ref)
(declare-const N7@206@01 Int)
(assert (=
  N7@206@01
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first $t@176@01))))))
; [exec]
; res_V0_CN2 := N6
; [exec]
; leftMost_V0_CN3 := N7
; [exec]
; res_V0_CN2 := res_V0_CN2
; [exec]
; leftMost_V0_CN3 := leftMost_V0_CN3
; [exec]
; label returnLabel
; [exec]
; res_V0 := res_V0_CN2
; [exec]
; leftMost_V0 := leftMost_V0_CN3
; [eval] !(res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] res_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 7
(pop) ; 7
; Joined path conditions
; [then-branch: 388 | N6@205@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 388 | N6@205@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 7
; [else-branch: 388 | N6@205@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] !Contains_8a1a376e_PMTree(res_V0, v_V0)
; [eval] Contains_8a1a376e_PMTree(res_V0, v_V0)
(push) ; 8
; [eval] !(self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$())
; [eval] self_V0 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$()
(push) ; 9
(pop) ; 9
; Joined path conditions
; [then-branch: 389 | N6@205@01 != shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 389 | N6@205@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 9
; [else-branch: 389 | N6@205@01 == shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (Contains_8a1a376e_PMTree%precondition $Snap.unit N6@205@01 v_V0@173@01))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (=
    N6@205@01
    (shStructDefault_$LeftA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$_ValueA_Intint$$$_S_$$$_RightA_PointerDefinedTree_8a1a376e_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (Contains_8a1a376e_PMTree%precondition $Snap.unit N6@205@01 v_V0@173@01)))
(push) ; 8
(assert (not (not (Contains_8a1a376e_PMTree $Snap.unit N6@205@01 v_V0@173@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (not (Contains_8a1a376e_PMTree $Snap.unit N6@205@01 v_V0@173@01)))
; [eval] !(v_V0 == leftMost_V0)
; [eval] v_V0 == leftMost_V0
(push) ; 8
(assert (not (not (= v_V0@173@01 N7@206@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (not (= v_V0@173@01 N7@206@01)))
(pop) ; 7
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
