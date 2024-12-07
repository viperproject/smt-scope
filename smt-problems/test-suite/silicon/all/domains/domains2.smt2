(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:43:00
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/domains/domains2.vpr
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
(declare-sort D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int> 0)
(declare-sort D3<Bool~_D3<Bool~_Bool>> 0)
(declare-sort D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int> 0)
(declare-sort D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> 0)
(declare-sort D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int> 0)
(declare-sort D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> 0)
(declare-sort D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int> 0)
(declare-sort D10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int> 0)
(declare-sort D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int> 0)
(declare-sort D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>> 0)
(declare-sort D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int> 0)
(declare-sort D2<D3<Bool~_Int>~_Bool> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int> 0)
(declare-sort D3<D3<Int~_Bool>~_Int> 0)
(declare-sort D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int> 0)
(declare-sort D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> 0)
(declare-sort D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_Int> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> 0)
(declare-sort D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int> 0)
(declare-sort D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> 0)
(declare-sort D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> 0)
(declare-sort D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> 0)
(declare-sort D3<D3<Bool~_Bool>~_Bool> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int> 0)
(declare-sort D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int> 0)
(declare-sort D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int> 0)
(declare-sort D3<Bool~_D3<Bool~_Int>> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> 0)
(declare-sort D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>> 0)
(declare-sort D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>> 0)
(declare-sort D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int> 0)
(declare-sort D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> 0)
(declare-sort D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int> 0)
(declare-sort D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> 0)
(declare-sort D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>> 0)
(declare-sort D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>> 0)
(declare-sort DD<DD<Int>> 0)
(declare-sort D2<D3<Int~_Bool>~_Int> 0)
(declare-sort D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> 0)
(declare-sort D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int> 0)
(declare-sort D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> 0)
(declare-sort D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> 0)
(declare-sort D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> 0)
(declare-sort D2<Bool~_Bool> 0)
(declare-sort D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> 0)
(declare-sort D3<Int~_D3<Int~_Bool>> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>> 0)
(declare-sort D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int> 0)
(declare-sort D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int> 0)
(declare-sort D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>> 0)
(declare-sort D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int> 0)
(declare-sort D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> 0)
(declare-sort D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> 0)
(declare-sort D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>> 0)
(declare-sort D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> 0)
(declare-sort D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> 0)
(declare-sort D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int> 0)
(declare-sort D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>> 0)
(declare-sort D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int> 0)
(declare-sort D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> 0)
(declare-sort D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int> 0)
(declare-sort D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> 0)
(declare-sort D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int> 0)
(declare-sort D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> 0)
(declare-sort D10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int> 0)
(declare-sort D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> 0)
(declare-sort D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> 0)
(declare-sort D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int> 0)
(declare-sort D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int> 0)
(declare-sort D10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>> 0)
(declare-sort D2<D3<Bool~_Bool>~_Bool> 0)
(declare-sort D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> 0)
(declare-sort D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> 0)
(declare-sort D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int> 0)
(declare-sort D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> 0)
(declare-sort D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> 0)
(declare-sort D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int> 0)
(declare-sort D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> 0)
(declare-sort D2<Bool~_D3<Bool~_Int>> 0)
(declare-sort D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> 0)
(declare-sort D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> 0)
(declare-sort D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int> 0)
(declare-sort D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> 0)
(declare-sort D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int> 0)
(declare-sort D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int> 0)
(declare-sort D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>> 0)
(declare-sort D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> 0)
(declare-sort D2<Bool~_D3<Bool~_Bool>> 0)
(declare-sort D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int> 0)
(declare-sort D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int> 0)
(declare-sort D3<Bool~_Int> 0)
(declare-sort D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int> 0)
(declare-sort D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>> 0)
(declare-sort D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int> 0)
(declare-sort D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int> 0)
(declare-sort D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>> 0)
(declare-sort D2<Int~_Bool> 0)
(declare-sort D2<Int~_D3<Int~_Bool>> 0)
(declare-sort D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> 0)
(declare-sort D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int> 0)
(declare-sort D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int> 0)
(declare-sort D3<D3<Bool~_Int>~_Bool> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> 0)
(declare-sort D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int> 0)
(declare-sort D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int> 0)
(declare-sort D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>> 0)
(declare-sort D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> 0)
(declare-sort D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int> 0)
(declare-sort D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> 0)
(declare-sort D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int> 0)
(declare-sort D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int> 0)
(declare-sort D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int~_Int> 0)
(declare-sort D3<Bool~_Bool> 0)
(declare-sort D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int> 0)
(declare-sort D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int> 0)
(declare-sort D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>> 0)
(declare-sort D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int> 0)
(declare-sort D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> 0)
(declare-sort D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> 0)
(declare-sort D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int> 0)
(declare-sort D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> 0)
(declare-sort D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> 0)
(declare-sort D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int> 0)
(declare-sort D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> 0)
(declare-sort D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> 0)
(declare-sort D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int> 0)
(declare-sort D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int> 0)
(declare-sort D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int> 0)
(declare-sort D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int> 0)
(declare-sort D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int> 0)
(declare-sort D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int> 0)
(declare-sort D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int> 0)
(declare-sort D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int> 0)
(declare-sort D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>> 0)
(declare-sort D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int> 0)
(declare-sort D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> 0)
(declare-sort DD<Int> 0)
(declare-sort D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> 0)
(declare-sort D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int> 0)
(declare-sort D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int> 0)
(declare-sort D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int> 0)
(declare-sort D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> 0)
(declare-sort D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int> 0)
(declare-sort D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int> 0)
(declare-sort D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> 0)
(declare-sort D2<Bool~_Int> 0)
(declare-sort D10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int> 0)
(declare-sort D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int> 0)
(declare-sort D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> 0)
(declare-sort D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int> 0)
(declare-sort D10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int> 0)
(declare-sort D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> 0)
(declare-sort D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>> 0)
(declare-sort D3<Int~_Bool> 0)
(declare-sort D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>> 0)
(declare-sort D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int> 0)
(declare-sort D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> 0)
(declare-sort D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>> 0)
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
(declare-fun $SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$Snap (D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int> ($Snap) D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>)
(assert (forall ((x D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int> x))
    :qid |$Snap.D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D3<Bool~_D3<Bool~_Bool>>To$Snap (D3<Bool~_D3<Bool~_Bool>>) $Snap)
(declare-fun $SortWrappers.$SnapToD3<Bool~_D3<Bool~_Bool>> ($Snap) D3<Bool~_D3<Bool~_Bool>>)
(assert (forall ((x D3<Bool~_D3<Bool~_Bool>>)) (!
    (= x ($SortWrappers.$SnapToD3<Bool~_D3<Bool~_Bool>>($SortWrappers.D3<Bool~_D3<Bool~_Bool>>To$Snap x)))
    :pattern (($SortWrappers.D3<Bool~_D3<Bool~_Bool>>To$Snap x))
    :qid |$Snap.$SnapToD3<Bool~_D3<Bool~_Bool>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D3<Bool~_D3<Bool~_Bool>>To$Snap($SortWrappers.$SnapToD3<Bool~_D3<Bool~_Bool>> x)))
    :pattern (($SortWrappers.$SnapToD3<Bool~_D3<Bool~_Bool>> x))
    :qid |$Snap.D3<Bool~_D3<Bool~_Bool>>To$SnapToD3<Bool~_D3<Bool~_Bool>>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$Snap (D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int> ($Snap) D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>)
(assert (forall ((x D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int> x))
    :qid |$Snap.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap (D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> ($Snap) D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>)
(assert (forall ((x D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> x))
    :qid |$Snap.D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap (D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>> ($Snap) D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>)
(assert (forall ((x D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>($SortWrappers.D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>> x))
    :qid |$Snap.D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap (D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> ($Snap) D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap (D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int> ($Snap) D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap (D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int> ($Snap) D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>)
(assert (forall ((x D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int> x))
    :qid |$Snap.D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap (D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>> ($Snap) D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap (D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>> ($Snap) D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap (D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> ($Snap) D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap (D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> ($Snap) D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap (D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> ($Snap) D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap (D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> ($Snap) D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap (D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> ($Snap) D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$Snap (D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int> ($Snap) D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>)
(assert (forall ((x D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int> x))
    :qid |$Snap.D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap (D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> ($Snap) D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$Snap (D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int> ($Snap) D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>)
(assert (forall ((x D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int> x))
    :qid |$Snap.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap (D10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>> ($Snap) D10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>($SortWrappers.D10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$SnapToD10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap (D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int> ($Snap) D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>)
(assert (forall ((x D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int> x))
    :qid |$Snap.D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int>To$Snap (D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int> ($Snap) D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int>)
(assert (forall ((x D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int>($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int> x))
    :qid |$Snap.D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int>To$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap (D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> ($Snap) D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>)
(assert (forall ((x D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> x))
    :qid |$Snap.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>To$Snap (D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>> ($Snap) D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>To$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$Snap (D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>> ($Snap) D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>>To$Snap (D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>> ($Snap) D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>>)
(assert (forall ((x D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>>($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>> x))
    :qid |$Snap.D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>>To$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap (D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> ($Snap) D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>To$Snap (D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int> ($Snap) D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>)
(assert (forall ((x D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int> x))
    :qid |$Snap.D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>To$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D2<D3<Bool~_Int>~_Bool>To$Snap (D2<D3<Bool~_Int>~_Bool>) $Snap)
(declare-fun $SortWrappers.$SnapToD2<D3<Bool~_Int>~_Bool> ($Snap) D2<D3<Bool~_Int>~_Bool>)
(assert (forall ((x D2<D3<Bool~_Int>~_Bool>)) (!
    (= x ($SortWrappers.$SnapToD2<D3<Bool~_Int>~_Bool>($SortWrappers.D2<D3<Bool~_Int>~_Bool>To$Snap x)))
    :pattern (($SortWrappers.D2<D3<Bool~_Int>~_Bool>To$Snap x))
    :qid |$Snap.$SnapToD2<D3<Bool~_Int>~_Bool>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D2<D3<Bool~_Int>~_Bool>To$Snap($SortWrappers.$SnapToD2<D3<Bool~_Int>~_Bool> x)))
    :pattern (($SortWrappers.$SnapToD2<D3<Bool~_Int>~_Bool> x))
    :qid |$Snap.D2<D3<Bool~_Int>~_Bool>To$SnapToD2<D3<Bool~_Int>~_Bool>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int>To$Snap (D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int> ($Snap) D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int>($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int>To$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D3<D3<Int~_Bool>~_Int>To$Snap (D3<D3<Int~_Bool>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD3<D3<Int~_Bool>~_Int> ($Snap) D3<D3<Int~_Bool>~_Int>)
(assert (forall ((x D3<D3<Int~_Bool>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD3<D3<Int~_Bool>~_Int>($SortWrappers.D3<D3<Int~_Bool>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D3<D3<Int~_Bool>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD3<D3<Int~_Bool>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D3<D3<Int~_Bool>~_Int>To$Snap($SortWrappers.$SnapToD3<D3<Int~_Bool>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD3<D3<Int~_Bool>~_Int> x))
    :qid |$Snap.D3<D3<Int~_Bool>~_Int>To$SnapToD3<D3<Int~_Bool>~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$Snap (D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int> ($Snap) D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>)
(assert (forall ((x D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int> x))
    :qid |$Snap.D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap (D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> ($Snap) D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>)
(assert (forall ((x D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> x))
    :qid |$Snap.D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap (D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> ($Snap) D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>)
(assert (forall ((x D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> x))
    :qid |$Snap.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap (D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> ($Snap) D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_Int>To$Snap (D10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_Int> ($Snap) D10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_Int>)
(assert (forall ((x D10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_Int>($SortWrappers.D10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_Int> x))
    :qid |$Snap.D10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_Int>To$SnapToD10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap (D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> ($Snap) D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap (D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>> ($Snap) D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$Snap (D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int> ($Snap) D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>)
(assert (forall ((x D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int> x))
    :qid |$Snap.D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap (D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> ($Snap) D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>)
(assert (forall ((x D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>($SortWrappers.D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> x))
    :qid |$Snap.D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap (D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> ($Snap) D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap (D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> ($Snap) D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D3<D3<Bool~_Bool>~_Bool>To$Snap (D3<D3<Bool~_Bool>~_Bool>) $Snap)
(declare-fun $SortWrappers.$SnapToD3<D3<Bool~_Bool>~_Bool> ($Snap) D3<D3<Bool~_Bool>~_Bool>)
(assert (forall ((x D3<D3<Bool~_Bool>~_Bool>)) (!
    (= x ($SortWrappers.$SnapToD3<D3<Bool~_Bool>~_Bool>($SortWrappers.D3<D3<Bool~_Bool>~_Bool>To$Snap x)))
    :pattern (($SortWrappers.D3<D3<Bool~_Bool>~_Bool>To$Snap x))
    :qid |$Snap.$SnapToD3<D3<Bool~_Bool>~_Bool>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D3<D3<Bool~_Bool>~_Bool>To$Snap($SortWrappers.$SnapToD3<D3<Bool~_Bool>~_Bool> x)))
    :pattern (($SortWrappers.$SnapToD3<D3<Bool~_Bool>~_Bool> x))
    :qid |$Snap.D3<D3<Bool~_Bool>~_Bool>To$SnapToD3<D3<Bool~_Bool>~_Bool>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int>To$Snap (D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int> ($Snap) D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int>($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int>To$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int>To$Snap (D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int> ($Snap) D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int>)
(assert (forall ((x D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int>($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int> x))
    :qid |$Snap.D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int>To$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$Snap (D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int> ($Snap) D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>)
(assert (forall ((x D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int> x))
    :qid |$Snap.D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D3<Bool~_D3<Bool~_Int>>To$Snap (D3<Bool~_D3<Bool~_Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD3<Bool~_D3<Bool~_Int>> ($Snap) D3<Bool~_D3<Bool~_Int>>)
(assert (forall ((x D3<Bool~_D3<Bool~_Int>>)) (!
    (= x ($SortWrappers.$SnapToD3<Bool~_D3<Bool~_Int>>($SortWrappers.D3<Bool~_D3<Bool~_Int>>To$Snap x)))
    :pattern (($SortWrappers.D3<Bool~_D3<Bool~_Int>>To$Snap x))
    :qid |$Snap.$SnapToD3<Bool~_D3<Bool~_Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D3<Bool~_D3<Bool~_Int>>To$Snap($SortWrappers.$SnapToD3<Bool~_D3<Bool~_Int>> x)))
    :pattern (($SortWrappers.$SnapToD3<Bool~_D3<Bool~_Int>> x))
    :qid |$Snap.D3<Bool~_D3<Bool~_Int>>To$SnapToD3<Bool~_D3<Bool~_Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap (D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> ($Snap) D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap (D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>> ($Snap) D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap (D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> ($Snap) D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap (D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> ($Snap) D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap (D10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>> ($Snap) D10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$Snap (D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>> ($Snap) D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>)
(assert (forall ((x D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>> x))
    :qid |$Snap.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap (D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> ($Snap) D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>)
(assert (forall ((x D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> x))
    :qid |$Snap.D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap (D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> ($Snap) D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap (D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int> ($Snap) D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>)
(assert (forall ((x D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int> x))
    :qid |$Snap.D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap (D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int> ($Snap) D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap (D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> ($Snap) D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap (D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> ($Snap) D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap (D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> ($Snap) D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>)
(assert (forall ((x D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> x))
    :qid |$Snap.D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap (D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> ($Snap) D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int>To$Snap (D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int> ($Snap) D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int>($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int>To$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap (D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> ($Snap) D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>)
(assert (forall ((x D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> x))
    :qid |$Snap.D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>To$Snap (D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>> ($Snap) D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>)
(assert (forall ((x D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>> x))
    :qid |$Snap.D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>To$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$Snap (D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>> ($Snap) D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>)
(assert (forall ((x D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>> x))
    :qid |$Snap.D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.DD<DD<Int>>To$Snap (DD<DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToDD<DD<Int>> ($Snap) DD<DD<Int>>)
(assert (forall ((x DD<DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToDD<DD<Int>>($SortWrappers.DD<DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.DD<DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToDD<DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.DD<DD<Int>>To$Snap($SortWrappers.$SnapToDD<DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToDD<DD<Int>> x))
    :qid |$Snap.DD<DD<Int>>To$SnapToDD<DD<Int>>|
    )))
(declare-fun $SortWrappers.D2<D3<Int~_Bool>~_Int>To$Snap (D2<D3<Int~_Bool>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD2<D3<Int~_Bool>~_Int> ($Snap) D2<D3<Int~_Bool>~_Int>)
(assert (forall ((x D2<D3<Int~_Bool>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD2<D3<Int~_Bool>~_Int>($SortWrappers.D2<D3<Int~_Bool>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D2<D3<Int~_Bool>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD2<D3<Int~_Bool>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D2<D3<Int~_Bool>~_Int>To$Snap($SortWrappers.$SnapToD2<D3<Int~_Bool>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD2<D3<Int~_Bool>~_Int> x))
    :qid |$Snap.D2<D3<Int~_Bool>~_Int>To$SnapToD2<D3<Int~_Bool>~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap (D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> ($Snap) D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>)
(assert (forall ((x D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> x))
    :qid |$Snap.D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap (D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> ($Snap) D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>To$Snap (D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int> ($Snap) D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>)
(assert (forall ((x D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int> x))
    :qid |$Snap.D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>To$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap (D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> ($Snap) D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap (D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> ($Snap) D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>)
(assert (forall ((x D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> x))
    :qid |$Snap.D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap (D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> ($Snap) D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap (D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> ($Snap) D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>)
(assert (forall ((x D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> x))
    :qid |$Snap.D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D2<Bool~_Bool>To$Snap (D2<Bool~_Bool>) $Snap)
(declare-fun $SortWrappers.$SnapToD2<Bool~_Bool> ($Snap) D2<Bool~_Bool>)
(assert (forall ((x D2<Bool~_Bool>)) (!
    (= x ($SortWrappers.$SnapToD2<Bool~_Bool>($SortWrappers.D2<Bool~_Bool>To$Snap x)))
    :pattern (($SortWrappers.D2<Bool~_Bool>To$Snap x))
    :qid |$Snap.$SnapToD2<Bool~_Bool>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D2<Bool~_Bool>To$Snap($SortWrappers.$SnapToD2<Bool~_Bool> x)))
    :pattern (($SortWrappers.$SnapToD2<Bool~_Bool> x))
    :qid |$Snap.D2<Bool~_Bool>To$SnapToD2<Bool~_Bool>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap (D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> ($Snap) D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>)
(assert (forall ((x D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> x))
    :qid |$Snap.D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D3<Int~_D3<Int~_Bool>>To$Snap (D3<Int~_D3<Int~_Bool>>) $Snap)
(declare-fun $SortWrappers.$SnapToD3<Int~_D3<Int~_Bool>> ($Snap) D3<Int~_D3<Int~_Bool>>)
(assert (forall ((x D3<Int~_D3<Int~_Bool>>)) (!
    (= x ($SortWrappers.$SnapToD3<Int~_D3<Int~_Bool>>($SortWrappers.D3<Int~_D3<Int~_Bool>>To$Snap x)))
    :pattern (($SortWrappers.D3<Int~_D3<Int~_Bool>>To$Snap x))
    :qid |$Snap.$SnapToD3<Int~_D3<Int~_Bool>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D3<Int~_D3<Int~_Bool>>To$Snap($SortWrappers.$SnapToD3<Int~_D3<Int~_Bool>> x)))
    :pattern (($SortWrappers.$SnapToD3<Int~_D3<Int~_Bool>> x))
    :qid |$Snap.D3<Int~_D3<Int~_Bool>>To$SnapToD3<Int~_D3<Int~_Bool>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap (D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>> ($Snap) D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$Snap (D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int> ($Snap) D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>)
(assert (forall ((x D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int> x))
    :qid |$Snap.D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap (D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int> ($Snap) D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>)
(assert (forall ((x D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int> x))
    :qid |$Snap.D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap (D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>> ($Snap) D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>)
(assert (forall ((x D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>> x))
    :qid |$Snap.D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap (D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> ($Snap) D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap (D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>> ($Snap) D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$Snap (D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int> ($Snap) D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>)
(assert (forall ((x D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int> x))
    :qid |$Snap.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap (D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>> ($Snap) D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap (D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> ($Snap) D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap (D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> ($Snap) D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap (D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> ($Snap) D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>To$Snap (D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>> ($Snap) D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>)
(assert (forall ((x D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>> x))
    :qid |$Snap.D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>To$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap (D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> ($Snap) D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap (D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> ($Snap) D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap (D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> ($Snap) D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int>To$Snap (D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int> ($Snap) D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int>)
(assert (forall ((x D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int>($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int> x))
    :qid |$Snap.D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int>To$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap (D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> ($Snap) D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int>To$Snap (D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int> ($Snap) D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int>)
(assert (forall ((x D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int>($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int> x))
    :qid |$Snap.D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int>To$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap (D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> ($Snap) D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap (D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> ($Snap) D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap (D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int> ($Snap) D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$Snap (D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>> ($Snap) D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>)
(assert (forall ((x D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>> x))
    :qid |$Snap.D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>To$Snap (D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int> ($Snap) D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>)
(assert (forall ((x D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int> x))
    :qid |$Snap.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>To$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap (D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> ($Snap) D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap (D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> ($Snap) D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>)
(assert (forall ((x D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> x))
    :qid |$Snap.D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap (D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> ($Snap) D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap (D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> ($Snap) D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap (D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int> ($Snap) D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>)
(assert (forall ((x D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int> x))
    :qid |$Snap.D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap (D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> ($Snap) D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap (D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> ($Snap) D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>)
(assert (forall ((x D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> x))
    :qid |$Snap.D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$Snap (D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int> ($Snap) D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>)
(assert (forall ((x D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int> x))
    :qid |$Snap.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap (D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> ($Snap) D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>)
(assert (forall ((x D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>($SortWrappers.D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> x))
    :qid |$Snap.D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int>To$Snap (D10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int> ($Snap) D10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int>)
(assert (forall ((x D10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int>($SortWrappers.D10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int> x))
    :qid |$Snap.D10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int>To$SnapToD10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap (D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> ($Snap) D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int>To$Snap (D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int> ($Snap) D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int>)
(assert (forall ((x D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int>($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int> x))
    :qid |$Snap.D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int>To$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap (D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> ($Snap) D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap (D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> ($Snap) D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>)
(assert (forall ((x D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> x))
    :qid |$Snap.D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap (D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>> ($Snap) D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>)
(assert (forall ((x D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>> x))
    :qid |$Snap.D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int>To$Snap (D10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int> ($Snap) D10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int>)
(assert (forall ((x D10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int>($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int> x))
    :qid |$Snap.D10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int>To$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap (D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int> ($Snap) D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>)
(assert (forall ((x D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int> x))
    :qid |$Snap.D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap (D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> ($Snap) D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap (D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int> ($Snap) D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>>To$Snap (D10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>> ($Snap) D10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>>)
(assert (forall ((x D10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>>($SortWrappers.D10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>> x))
    :qid |$Snap.D10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>>To$SnapToD10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D2<D3<Bool~_Bool>~_Bool>To$Snap (D2<D3<Bool~_Bool>~_Bool>) $Snap)
(declare-fun $SortWrappers.$SnapToD2<D3<Bool~_Bool>~_Bool> ($Snap) D2<D3<Bool~_Bool>~_Bool>)
(assert (forall ((x D2<D3<Bool~_Bool>~_Bool>)) (!
    (= x ($SortWrappers.$SnapToD2<D3<Bool~_Bool>~_Bool>($SortWrappers.D2<D3<Bool~_Bool>~_Bool>To$Snap x)))
    :pattern (($SortWrappers.D2<D3<Bool~_Bool>~_Bool>To$Snap x))
    :qid |$Snap.$SnapToD2<D3<Bool~_Bool>~_Bool>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D2<D3<Bool~_Bool>~_Bool>To$Snap($SortWrappers.$SnapToD2<D3<Bool~_Bool>~_Bool> x)))
    :pattern (($SortWrappers.$SnapToD2<D3<Bool~_Bool>~_Bool> x))
    :qid |$Snap.D2<D3<Bool~_Bool>~_Bool>To$SnapToD2<D3<Bool~_Bool>~_Bool>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap (D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> ($Snap) D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>)
(assert (forall ((x D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> x))
    :qid |$Snap.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap (D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> ($Snap) D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap (D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> ($Snap) D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>)
(assert (forall ((x D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> x))
    :qid |$Snap.D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$Snap (D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int> ($Snap) D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>)
(assert (forall ((x D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int> x))
    :qid |$Snap.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap (D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> ($Snap) D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap (D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> ($Snap) D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>)
(assert (forall ((x D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> x))
    :qid |$Snap.D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap (D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> ($Snap) D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>($SortWrappers.D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap (D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int> ($Snap) D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>)
(assert (forall ((x D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int> x))
    :qid |$Snap.D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap (D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> ($Snap) D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap (D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> ($Snap) D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>)
(assert (forall ((x D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> x))
    :qid |$Snap.D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap (D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> ($Snap) D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>)
(assert (forall ((x D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> x))
    :qid |$Snap.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap (D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int> ($Snap) D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap (D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> ($Snap) D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap (D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> ($Snap) D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap (D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int> ($Snap) D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>)
(assert (forall ((x D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>($SortWrappers.D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int> x))
    :qid |$Snap.D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap (D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> ($Snap) D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D2<Bool~_D3<Bool~_Int>>To$Snap (D2<Bool~_D3<Bool~_Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD2<Bool~_D3<Bool~_Int>> ($Snap) D2<Bool~_D3<Bool~_Int>>)
(assert (forall ((x D2<Bool~_D3<Bool~_Int>>)) (!
    (= x ($SortWrappers.$SnapToD2<Bool~_D3<Bool~_Int>>($SortWrappers.D2<Bool~_D3<Bool~_Int>>To$Snap x)))
    :pattern (($SortWrappers.D2<Bool~_D3<Bool~_Int>>To$Snap x))
    :qid |$Snap.$SnapToD2<Bool~_D3<Bool~_Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D2<Bool~_D3<Bool~_Int>>To$Snap($SortWrappers.$SnapToD2<Bool~_D3<Bool~_Int>> x)))
    :pattern (($SortWrappers.$SnapToD2<Bool~_D3<Bool~_Int>> x))
    :qid |$Snap.D2<Bool~_D3<Bool~_Int>>To$SnapToD2<Bool~_D3<Bool~_Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap (D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> ($Snap) D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap (D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> ($Snap) D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap (D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> ($Snap) D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap (D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> ($Snap) D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>($SortWrappers.D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$Snap (D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>> ($Snap) D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>)
(assert (forall ((x D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>> x))
    :qid |$Snap.D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap (D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> ($Snap) D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap (D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>> ($Snap) D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap (D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> ($Snap) D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap (D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> ($Snap) D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap (D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> ($Snap) D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>($SortWrappers.D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$SnapToD10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap (D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> ($Snap) D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>)
(assert (forall ((x D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> x))
    :qid |$Snap.D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>>To$Snap (D10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>> ($Snap) D10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>>($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>>To$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap (D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> ($Snap) D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$Snap (D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int> ($Snap) D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap (D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>> ($Snap) D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>)
(assert (forall ((x D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>> x))
    :qid |$Snap.D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap (D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> ($Snap) D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>)
(assert (forall ((x D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> x))
    :qid |$Snap.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap (D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> ($Snap) D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>)
(assert (forall ((x D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> x))
    :qid |$Snap.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>To$Snap (D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int> ($Snap) D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>To$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$Snap (D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int> ($Snap) D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>)
(assert (forall ((x D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int> x))
    :qid |$Snap.D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$Snap (D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>> ($Snap) D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap (D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> ($Snap) D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D2<Bool~_D3<Bool~_Bool>>To$Snap (D2<Bool~_D3<Bool~_Bool>>) $Snap)
(declare-fun $SortWrappers.$SnapToD2<Bool~_D3<Bool~_Bool>> ($Snap) D2<Bool~_D3<Bool~_Bool>>)
(assert (forall ((x D2<Bool~_D3<Bool~_Bool>>)) (!
    (= x ($SortWrappers.$SnapToD2<Bool~_D3<Bool~_Bool>>($SortWrappers.D2<Bool~_D3<Bool~_Bool>>To$Snap x)))
    :pattern (($SortWrappers.D2<Bool~_D3<Bool~_Bool>>To$Snap x))
    :qid |$Snap.$SnapToD2<Bool~_D3<Bool~_Bool>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D2<Bool~_D3<Bool~_Bool>>To$Snap($SortWrappers.$SnapToD2<Bool~_D3<Bool~_Bool>> x)))
    :pattern (($SortWrappers.$SnapToD2<Bool~_D3<Bool~_Bool>> x))
    :qid |$Snap.D2<Bool~_D3<Bool~_Bool>>To$SnapToD2<Bool~_D3<Bool~_Bool>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap (D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> ($Snap) D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int>To$Snap (D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int> ($Snap) D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int>($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int>To$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$Snap (D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int> ($Snap) D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>)
(assert (forall ((x D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int> x))
    :qid |$Snap.D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D3<Bool~_Int>To$Snap (D3<Bool~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD3<Bool~_Int> ($Snap) D3<Bool~_Int>)
(assert (forall ((x D3<Bool~_Int>)) (!
    (= x ($SortWrappers.$SnapToD3<Bool~_Int>($SortWrappers.D3<Bool~_Int>To$Snap x)))
    :pattern (($SortWrappers.D3<Bool~_Int>To$Snap x))
    :qid |$Snap.$SnapToD3<Bool~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D3<Bool~_Int>To$Snap($SortWrappers.$SnapToD3<Bool~_Int> x)))
    :pattern (($SortWrappers.$SnapToD3<Bool~_Int> x))
    :qid |$Snap.D3<Bool~_Int>To$SnapToD3<Bool~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap (D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> ($Snap) D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>)
(assert (forall ((x D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> x))
    :qid |$Snap.D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$Snap (D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>> ($Snap) D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap (D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> ($Snap) D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>To$Snap (D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int> ($Snap) D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>)
(assert (forall ((x D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int> x))
    :qid |$Snap.D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>To$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap (D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> ($Snap) D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>)
(assert (forall ((x D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> x))
    :qid |$Snap.D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap (D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> ($Snap) D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap (D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>> ($Snap) D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap (D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int> ($Snap) D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>)
(assert (forall ((x D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int> x))
    :qid |$Snap.D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>To$Snap (D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int> ($Snap) D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>)
(assert (forall ((x D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int> x))
    :qid |$Snap.D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>To$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap (D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>> ($Snap) D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>)
(assert (forall ((x D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>($SortWrappers.D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>> x))
    :qid |$Snap.D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$SnapToD10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D2<Int~_Bool>To$Snap (D2<Int~_Bool>) $Snap)
(declare-fun $SortWrappers.$SnapToD2<Int~_Bool> ($Snap) D2<Int~_Bool>)
(assert (forall ((x D2<Int~_Bool>)) (!
    (= x ($SortWrappers.$SnapToD2<Int~_Bool>($SortWrappers.D2<Int~_Bool>To$Snap x)))
    :pattern (($SortWrappers.D2<Int~_Bool>To$Snap x))
    :qid |$Snap.$SnapToD2<Int~_Bool>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D2<Int~_Bool>To$Snap($SortWrappers.$SnapToD2<Int~_Bool> x)))
    :pattern (($SortWrappers.$SnapToD2<Int~_Bool> x))
    :qid |$Snap.D2<Int~_Bool>To$SnapToD2<Int~_Bool>|
    )))
(declare-fun $SortWrappers.D2<Int~_D3<Int~_Bool>>To$Snap (D2<Int~_D3<Int~_Bool>>) $Snap)
(declare-fun $SortWrappers.$SnapToD2<Int~_D3<Int~_Bool>> ($Snap) D2<Int~_D3<Int~_Bool>>)
(assert (forall ((x D2<Int~_D3<Int~_Bool>>)) (!
    (= x ($SortWrappers.$SnapToD2<Int~_D3<Int~_Bool>>($SortWrappers.D2<Int~_D3<Int~_Bool>>To$Snap x)))
    :pattern (($SortWrappers.D2<Int~_D3<Int~_Bool>>To$Snap x))
    :qid |$Snap.$SnapToD2<Int~_D3<Int~_Bool>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D2<Int~_D3<Int~_Bool>>To$Snap($SortWrappers.$SnapToD2<Int~_D3<Int~_Bool>> x)))
    :pattern (($SortWrappers.$SnapToD2<Int~_D3<Int~_Bool>> x))
    :qid |$Snap.D2<Int~_D3<Int~_Bool>>To$SnapToD2<Int~_D3<Int~_Bool>>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap (D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> ($Snap) D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap (D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> ($Snap) D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int>To$Snap (D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int> ($Snap) D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int>($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int>To$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap (D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> ($Snap) D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap (D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> ($Snap) D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>)
(assert (forall ((x D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> x))
    :qid |$Snap.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int>To$Snap (D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int> ($Snap) D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int>)
(assert (forall ((x D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int>($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int> x))
    :qid |$Snap.D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int>To$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap (D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> ($Snap) D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>)
(assert (forall ((x D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> x))
    :qid |$Snap.D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap (D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int> ($Snap) D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D3<D3<Bool~_Int>~_Bool>To$Snap (D3<D3<Bool~_Int>~_Bool>) $Snap)
(declare-fun $SortWrappers.$SnapToD3<D3<Bool~_Int>~_Bool> ($Snap) D3<D3<Bool~_Int>~_Bool>)
(assert (forall ((x D3<D3<Bool~_Int>~_Bool>)) (!
    (= x ($SortWrappers.$SnapToD3<D3<Bool~_Int>~_Bool>($SortWrappers.D3<D3<Bool~_Int>~_Bool>To$Snap x)))
    :pattern (($SortWrappers.D3<D3<Bool~_Int>~_Bool>To$Snap x))
    :qid |$Snap.$SnapToD3<D3<Bool~_Int>~_Bool>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D3<D3<Bool~_Int>~_Bool>To$Snap($SortWrappers.$SnapToD3<D3<Bool~_Int>~_Bool> x)))
    :pattern (($SortWrappers.$SnapToD3<D3<Bool~_Int>~_Bool> x))
    :qid |$Snap.D3<D3<Bool~_Int>~_Bool>To$SnapToD3<D3<Bool~_Int>~_Bool>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap (D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> ($Snap) D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap (D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> ($Snap) D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap (D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> ($Snap) D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>)
(assert (forall ((x D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> x))
    :qid |$Snap.D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap (D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> ($Snap) D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap (D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int> ($Snap) D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>)
(assert (forall ((x D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int> x))
    :qid |$Snap.D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap (D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> ($Snap) D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>)
(assert (forall ((x D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> x))
    :qid |$Snap.D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$Snap (D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int> ($Snap) D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap (D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> ($Snap) D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>To$Snap (D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int> ($Snap) D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>)
(assert (forall ((x D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int> x))
    :qid |$Snap.D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>To$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$Snap (D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int> ($Snap) D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap (D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>> ($Snap) D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>)
(assert (forall ((x D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>> x))
    :qid |$Snap.D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap (D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> ($Snap) D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>)
(assert (forall ((x D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> x))
    :qid |$Snap.D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap (D10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>> ($Snap) D10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int>To$Snap (D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int> ($Snap) D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int>)
(assert (forall ((x D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int>($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int> x))
    :qid |$Snap.D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int>To$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap (D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> ($Snap) D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap (D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> ($Snap) D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>)
(assert (forall ((x D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> x))
    :qid |$Snap.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap (D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int> ($Snap) D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>)
(assert (forall ((x D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int> x))
    :qid |$Snap.D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap (D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> ($Snap) D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>)
(assert (forall ((x D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> x))
    :qid |$Snap.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>To$Snap (D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int> ($Snap) D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>)
(assert (forall ((x D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int> x))
    :qid |$Snap.D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>To$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int>To$Snap (D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int> ($Snap) D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int>)
(assert (forall ((x D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int>($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int> x))
    :qid |$Snap.D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int>To$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap (D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> ($Snap) D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int~_Int>To$Snap (D10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int~_Int> ($Snap) D10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int~_Int>)
(assert (forall ((x D10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int~_Int>($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int~_Int> x))
    :qid |$Snap.D10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int~_Int>To$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D3<Bool~_Bool>To$Snap (D3<Bool~_Bool>) $Snap)
(declare-fun $SortWrappers.$SnapToD3<Bool~_Bool> ($Snap) D3<Bool~_Bool>)
(assert (forall ((x D3<Bool~_Bool>)) (!
    (= x ($SortWrappers.$SnapToD3<Bool~_Bool>($SortWrappers.D3<Bool~_Bool>To$Snap x)))
    :pattern (($SortWrappers.D3<Bool~_Bool>To$Snap x))
    :qid |$Snap.$SnapToD3<Bool~_Bool>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D3<Bool~_Bool>To$Snap($SortWrappers.$SnapToD3<Bool~_Bool> x)))
    :pattern (($SortWrappers.$SnapToD3<Bool~_Bool> x))
    :qid |$Snap.D3<Bool~_Bool>To$SnapToD3<Bool~_Bool>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap (D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int> ($Snap) D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>)
(assert (forall ((x D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>($SortWrappers.D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int> x))
    :qid |$Snap.D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$SnapToD10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>To$Snap (D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int> ($Snap) D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>)
(assert (forall ((x D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int> x))
    :qid |$Snap.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>To$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap (D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>> ($Snap) D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>)
(assert (forall ((x D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>> x))
    :qid |$Snap.D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$Snap (D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int> ($Snap) D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>)
(assert (forall ((x D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int> x))
    :qid |$Snap.D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap (D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> ($Snap) D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>)
(assert (forall ((x D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> x))
    :qid |$Snap.D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap (D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> ($Snap) D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap (D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> ($Snap) D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>)
(assert (forall ((x D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> x))
    :qid |$Snap.D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap (D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int> ($Snap) D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>)
(assert (forall ((x D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int> x))
    :qid |$Snap.D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap (D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> ($Snap) D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap (D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> ($Snap) D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>To$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap (D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> ($Snap) D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>)
(assert (forall ((x D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> x))
    :qid |$Snap.D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$Snap (D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int> ($Snap) D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>)
(assert (forall ((x D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int> x))
    :qid |$Snap.D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap (D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> ($Snap) D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap (D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> ($Snap) D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>)
(assert (forall ((x D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> x))
    :qid |$Snap.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>To$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap (D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> ($Snap) D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>)
(assert (forall ((x D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> x))
    :qid |$Snap.D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap (D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> ($Snap) D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>)
(assert (forall ((x D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> x))
    :qid |$Snap.D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>To$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>>To$Snap (D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>> ($Snap) D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>>($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>>To$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>To$Snap (D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int> ($Snap) D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>)
(assert (forall ((x D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int> x))
    :qid |$Snap.D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>To$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>To$Snap (D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int> ($Snap) D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>To$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int>To$Snap (D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int> ($Snap) D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int>)
(assert (forall ((x D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int>($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int> x))
    :qid |$Snap.D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int>To$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$Snap (D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int> ($Snap) D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>)
(assert (forall ((x D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int> x))
    :qid |$Snap.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap (D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int> ($Snap) D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>)
(assert (forall ((x D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int> x))
    :qid |$Snap.D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap (D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>> ($Snap) D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int>To$Snap (D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int> ($Snap) D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int>)
(assert (forall ((x D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int>($SortWrappers.D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int> x))
    :qid |$Snap.D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int>To$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$Snap (D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int> ($Snap) D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>To$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap (D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> ($Snap) D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap (D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> ($Snap) D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap (D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int> ($Snap) D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>)
(assert (forall ((x D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>($SortWrappers.D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int> x))
    :qid |$Snap.D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$SnapToD10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap (D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> ($Snap) D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>)
(assert (forall ((x D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> x))
    :qid |$Snap.D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap (D10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> ($Snap) D10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int>To$Snap (D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int> ($Snap) D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int>)
(assert (forall ((x D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int>($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int> x))
    :qid |$Snap.D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int>To$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap (D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int> ($Snap) D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>)
(assert (forall ((x D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int> x))
    :qid |$Snap.D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>To$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap (D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> ($Snap) D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>)
(assert (forall ((x D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> x))
    :qid |$Snap.D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap (D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>> ($Snap) D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int>To$Snap (D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int> ($Snap) D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int>)
(assert (forall ((x D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int>($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int> x))
    :qid |$Snap.D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int>To$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap (D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> ($Snap) D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>To$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap (D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> ($Snap) D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>To$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap (D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> ($Snap) D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.DD<Int>To$Snap (DD<Int>) $Snap)
(declare-fun $SortWrappers.$SnapToDD<Int> ($Snap) DD<Int>)
(assert (forall ((x DD<Int>)) (!
    (= x ($SortWrappers.$SnapToDD<Int>($SortWrappers.DD<Int>To$Snap x)))
    :pattern (($SortWrappers.DD<Int>To$Snap x))
    :qid |$Snap.$SnapToDD<Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.DD<Int>To$Snap($SortWrappers.$SnapToDD<Int> x)))
    :pattern (($SortWrappers.$SnapToDD<Int> x))
    :qid |$Snap.DD<Int>To$SnapToDD<Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap (D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>> ($Snap) D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>)
(assert (forall ((x D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>> x))
    :qid |$Snap.D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>To$SnapToD10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap (D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> ($Snap) D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>)
(assert (forall ((x D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> x))
    :qid |$Snap.D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>To$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap (D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> ($Snap) D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$SnapToD10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int>To$Snap (D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int> ($Snap) D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int>($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int>To$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap (D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int> ($Snap) D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>)
(assert (forall ((x D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int> x))
    :qid |$Snap.D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>To$SnapToD10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap (D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>> ($Snap) D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>To$SnapToD10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>To$Snap (D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int> ($Snap) D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>)
(assert (forall ((x D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int> x))
    :qid |$Snap.D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>To$SnapToD10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$Snap (D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int> ($Snap) D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$Snap (D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int> ($Snap) D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap (D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> ($Snap) D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>)
(assert (forall ((x D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> x))
    :qid |$Snap.D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>To$SnapToD10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>To$Snap (D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int> ($Snap) D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>To$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>To$Snap (D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int> ($Snap) D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>To$SnapToD10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap (D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> ($Snap) D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>)
(assert (forall ((x D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> x))
    :qid |$Snap.D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>To$SnapToD10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$Snap (D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int> ($Snap) D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>)
(assert (forall ((x D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int> x))
    :qid |$Snap.D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>To$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int>To$Snap (D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int> ($Snap) D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int>)
(assert (forall ((x D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int>($SortWrappers.D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int> x))
    :qid |$Snap.D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int>To$SnapToD10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap (D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> ($Snap) D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>)
(assert (forall ((x D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> x))
    :qid |$Snap.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D2<Bool~_Int>To$Snap (D2<Bool~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD2<Bool~_Int> ($Snap) D2<Bool~_Int>)
(assert (forall ((x D2<Bool~_Int>)) (!
    (= x ($SortWrappers.$SnapToD2<Bool~_Int>($SortWrappers.D2<Bool~_Int>To$Snap x)))
    :pattern (($SortWrappers.D2<Bool~_Int>To$Snap x))
    :qid |$Snap.$SnapToD2<Bool~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D2<Bool~_Int>To$Snap($SortWrappers.$SnapToD2<Bool~_Int> x)))
    :pattern (($SortWrappers.$SnapToD2<Bool~_Int> x))
    :qid |$Snap.D2<Bool~_Int>To$SnapToD2<Bool~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int>To$Snap (D10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int> ($Snap) D10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int>)
(assert (forall ((x D10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int>($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int> x))
    :qid |$Snap.D10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int>To$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap (D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> ($Snap) D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>To$SnapToD10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>To$Snap (D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int> ($Snap) D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>)
(assert (forall ((x D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int> x))
    :qid |$Snap.D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>To$SnapToD10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap (D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> ($Snap) D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>)
(assert (forall ((x D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> x))
    :qid |$Snap.D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>To$SnapToD10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$Snap (D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int> ($Snap) D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>)
(assert (forall ((x D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int> x))
    :qid |$Snap.D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>To$SnapToD10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap (D10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int> ($Snap) D10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>)
(assert (forall ((x D10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int> x))
    :qid |$Snap.D10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>To$SnapToD10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap (D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> ($Snap) D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>)
(assert (forall ((x D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> x))
    :qid |$Snap.D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$SnapToD10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap (D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>> ($Snap) D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>To$SnapToD10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D3<Int~_Bool>To$Snap (D3<Int~_Bool>) $Snap)
(declare-fun $SortWrappers.$SnapToD3<Int~_Bool> ($Snap) D3<Int~_Bool>)
(assert (forall ((x D3<Int~_Bool>)) (!
    (= x ($SortWrappers.$SnapToD3<Int~_Bool>($SortWrappers.D3<Int~_Bool>To$Snap x)))
    :pattern (($SortWrappers.D3<Int~_Bool>To$Snap x))
    :qid |$Snap.$SnapToD3<Int~_Bool>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D3<Int~_Bool>To$Snap($SortWrappers.$SnapToD3<Int~_Bool> x)))
    :pattern (($SortWrappers.$SnapToD3<Int~_Bool> x))
    :qid |$Snap.D3<Int~_Bool>To$SnapToD3<Int~_Bool>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>To$Snap (D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>> ($Snap) D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>To$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>To$Snap (D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int> ($Snap) D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>)
(assert (forall ((x D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int> x))
    :qid |$Snap.D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>To$SnapToD10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>|
    )))
(declare-fun $SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap (D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> ($Snap) D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>)
(assert (forall ((x D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$Snap($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> x))
    :qid |$Snap.D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>To$SnapToD10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>|
    )))
(declare-fun $SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$Snap (D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>> ($Snap) D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>)
(assert (forall ((x D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>)) (!
    (= x ($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$Snap x)))
    :pattern (($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$Snap x))
    :qid |$Snap.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$Snap($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>> x)))
    :pattern (($SortWrappers.$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>> x))
    :qid |$Snap.D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>To$SnapToD10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>|
    )))
; ////////// Symbols
(declare-const i2<D2<Bool~_D3<Bool~_Bool>>> D2<Bool~_D3<Bool~_Bool>>)
(declare-const i3<D2<D3<Bool~_Bool>~_Bool>> D2<D3<Bool~_Bool>~_Bool>)
(declare-fun pp1<D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>> (D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>> D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>) D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>)
(declare-fun pp1<D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>> (D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>> D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int> D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int> D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>) D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>)
(declare-fun pp1<D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>> (D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>) D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>)
(declare-fun pp1<D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>> (D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>) D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>)
(declare-const i2<D2<Bool~_D3<Bool~_Int>>> D2<Bool~_D3<Bool~_Int>>)
(declare-const i3<D2<D3<Bool~_Int>~_Bool>> D2<D3<Bool~_Int>~_Bool>)
(declare-fun pp1<D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>> (D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int> D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int> D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>> D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>) D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>)
(declare-fun pp1<D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>> (D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>) D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>)
(declare-fun pp1<D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>> (D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>> D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>) D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>)
(declare-fun pp1<D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>> (D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>) D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>)
(declare-fun pp1<D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int>> (D10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int~_Int> D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int> D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int> D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int> D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int> D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int> D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int> D10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_Int> D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int>) D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int>)
(declare-const i2<D2<Bool~_Bool>> D2<Bool~_Bool>)
(declare-const i3<D2<Bool~_Bool>> D2<Bool~_Bool>)
(declare-const i4<D2<D3<Bool~_Bool>~_Bool>> D2<D3<Bool~_Bool>~_Bool>)
(declare-fun pp1<D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>> (D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int> D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>) D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>)
(declare-fun pp1<D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>> (D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int> D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>) D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>)
(declare-fun pp1<D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>> (D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>) D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>)
(declare-fun pp1<D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>> (D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>> D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>) D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>)
(declare-fun pp1<D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>> (D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>> D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>) D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>)
(declare-fun pp1<D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>> (D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int> D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>) D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>)
(declare-const i2<D2<D3<Bool~_Int>~_Bool>> D2<D3<Bool~_Int>~_Bool>)
(declare-const i3<D2<Bool~_D3<Bool~_Int>>> D2<Bool~_D3<Bool~_Int>>)
(declare-const h2<D3<D3<Bool~_Bool>~_Bool>> D3<D3<Bool~_Bool>~_Bool>)
(declare-fun pp1<D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>> (D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>) D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>)
(declare-fun pp1<D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>> (D10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>> D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>) D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>)
(declare-fun pp1<D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>> (D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>) D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>)
(declare-fun pp1<D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>> (D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int> D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int> D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>) D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>)
(declare-fun pp1<D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>> (D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>) D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>)
(declare-fun pp1<D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>> (D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>) D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>)
(declare-const i2<D2<Int~_D3<Int~_Bool>>> D2<Int~_D3<Int~_Bool>>)
(declare-const i3<D2<D3<Int~_Bool>~_Int>> D2<D3<Int~_Bool>~_Int>)
(declare-fun pp1<D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>> (D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>> D10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>) D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>)
(declare-fun pp1<D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>> (D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>) D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>)
(declare-fun pp1<D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>> (D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>) D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>)
(declare-fun pp1<D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>> (D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>) D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>)
(declare-fun pp1<D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>> (D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>) D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>)
(declare-fun pp1<D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int>> (D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int> D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int> D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int>) D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int>)
(declare-fun pp1<D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>> (D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>) D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>)
(declare-fun pp1<D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>> (D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int> D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int> D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>) D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>)
(declare-fun pp1<D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>> (D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int> D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int> D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int> D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int> D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int> D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int> D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int> D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>) D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>)
(declare-fun pp1<D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>> (D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>) D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>)
(declare-fun pp1<D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>> (D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>) D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>)
(declare-fun pp1<D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>> (D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>) D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>)
(declare-fun pp1<D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>> (D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>) D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>)
(declare-const h2<D3<Int~_D3<Int~_Bool>>> D3<Int~_D3<Int~_Bool>>)
(declare-fun pp1<D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>> (D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>) D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>)
(declare-fun pp1<D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>> (D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>) D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>)
(declare-fun pp1<D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>> (D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>) D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>)
(declare-fun pp1<D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>> (D10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>> D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>) D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>)
(declare-fun pp1<D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>> (D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>> D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>) D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>)
(declare-fun pp1<D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>> (D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int> D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int> D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int> D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int> D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int> D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>) D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int>)
(declare-fun pp1<D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>> (D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>) D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>)
(declare-fun pp1<D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>> (D10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>) D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>)
(declare-fun pp1<D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>> (D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int> D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>) D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>)
(declare-fun pp1<D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>> (D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int> D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>) D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>)
(declare-fun pp1<D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>> (D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>) D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>)
(declare-fun pp1<D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>> (D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>) D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>)
(declare-fun pp1<D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>> (D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int> D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>) D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>)
(declare-fun pp1<D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int>> (D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int> D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int> D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int>) D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int>)
(declare-fun pp1<D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>> (D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>> D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>) D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>>)
(declare-fun pp1<D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>> (D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>) D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>)
(declare-const h2<D3<Bool~_D3<Bool~_Bool>>> D3<Bool~_D3<Bool~_Bool>>)
(declare-fun pp1<D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>> (D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>) D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>>)
(declare-fun pp1<D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>> (D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>) D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>)
(declare-fun pp1<D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>> (D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int> D10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>) D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>)
(declare-fun pp1<D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>> (D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int> D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>) D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>)
(declare-fun pp1<D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>> (D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>) D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>)
(declare-fun pp1<D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>> (D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int> D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>) D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>)
(declare-fun pp1<D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>> (D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>> D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>) D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>)
(declare-fun pp1<D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>> (D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>> D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>) D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>)
(declare-fun pp1<D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>> (D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>) D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>)
(declare-fun pp1<D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>> (D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>) D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>)
(declare-fun pp1<D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>> (D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int> D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int> D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>) D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int>)
(declare-fun pp1<D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>> (D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int> D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>) D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>)
(declare-fun pp1<D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>> (D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>) D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>)
(declare-fun pp1<D10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>> (D10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>> D10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>) D10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>>)
(declare-fun pp1<D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>> (D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>) D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>)
(declare-fun pp1<D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int>> (D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int> D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int> D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int> D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int> D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int> D10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int> D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int> D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int> D10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int>) D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int>)
(declare-fun pp1<D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>> (D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>> D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>) D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>)
(declare-fun pp1<D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>> (D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>) D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>)
(declare-fun pp1<D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>> (D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>) D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>)
(declare-fun pp1<D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int>> (D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int> D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int> D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int> D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int>) D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int>)
(declare-fun pp1<D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int>> (D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int> D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int> D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int> D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int> D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int> D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int> D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int> D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int> D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int>) D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int>)
(declare-fun pp1<D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>> (D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>) D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>)
(declare-fun pp1<D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>> (D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int> D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int>) D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>>)
(declare-fun pp1<D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>> (D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int> D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int> D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>) D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>)
(declare-fun pp1<D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>> (D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int> D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>) D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int>)
(declare-fun pp1<D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>> (D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int> D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>) D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int>)
(declare-fun pp1<D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>> (D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>) D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>)
(declare-fun pp1<D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>> (D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>) D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>)
(declare-fun pp1<D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>> (D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int> D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int> D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>) D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int>)
(declare-fun pp1<D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>> (D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>) D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>)
(declare-fun pp1<D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>> (D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>) D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>>)
(declare-fun pp1<D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>> (D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int> D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int> D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>) D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>)
(declare-const h2<D3<Bool~_Int>> D3<Bool~_Int>)
(declare-const h2<D3<D3<Int~_Bool>~_Int>> D3<D3<Int~_Bool>~_Int>)
(declare-fun pp1<D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>> (D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>) D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>)
(declare-fun pp1<D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>> (D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>) D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>)
(declare-const h2<D3<Bool~_Bool>> D3<Bool~_Bool>)
(declare-fun pp1<D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>> (D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int> D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int>) D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>>)
(declare-fun pp1<D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>> (D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>) D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>)
(declare-fun pp1<D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>> (D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int> D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int>) D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>>)
(declare-fun pp1<D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>> (D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int> D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int> D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int> D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int> D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>> D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>>) D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int>)
(declare-fun pp1<D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>>> (D10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int> D10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int> D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int>) D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>>)
(declare-fun pp1<D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>> (D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>> D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>) D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>)
(declare-const h2<D3<Bool~_D3<Bool~_Int>>> D3<Bool~_D3<Bool~_Int>>)
(declare-fun pp1<D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>> (D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int> D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>) D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>)
(declare-fun pp1<D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>> (D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>) D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>)
(declare-fun pp1<D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>> (D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>) D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>)
(declare-fun pp1<D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>> (D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>) D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>)
(declare-fun pp1<D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>> (D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>) D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int>)
(declare-fun pp1<D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>> (D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>) D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>)
(declare-fun pp1<D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>> (D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>) D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>)
(declare-const h2<D3<D3<Bool~_Int>~_Bool>> D3<D3<Bool~_Int>~_Bool>)
(declare-fun pp1<D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>> (D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int> D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>) D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int>)
(declare-const h2<D3<Int~_Bool>> D3<Int~_Bool>)
(declare-fun pp1<D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>> (D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int> D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>) D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int>)
(declare-fun pp1<D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>> (D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int> D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>) D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int>)
(declare-fun pp1<D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>> (D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int> D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>) D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int>)
(declare-fun pp1<D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>> (D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>) D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>)
(declare-fun pp1<D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>> (D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>) D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>)
(declare-fun pp1<D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int>> (D10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>> D10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>> D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>>) D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int>)
(declare-fun pp1<D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>> (D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>> D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int> D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>) D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>)
(declare-fun pp1<D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>> (D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>> D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>) D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>)
(declare-const i2<D2<D3<Bool~_Bool>~_Bool>> D2<D3<Bool~_Bool>~_Bool>)
(declare-const i3<D2<Bool~_D3<Bool~_Bool>>> D2<Bool~_D3<Bool~_Bool>>)
(declare-const i2<D2<Int~_Bool>> D2<Int~_Bool>)
(declare-const i3<D2<Bool~_Int>> D2<Bool~_Int>)
(declare-const i4<D2<D3<Int~_Bool>~_Int>> D2<D3<Int~_Bool>~_Int>)
(declare-fun pp1<D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>> (D10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int> D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int>) D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>>)
(declare-fun pp1<D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int>> (D10<DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int> D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int> D10<Int~_DD<Int>~_Int~_Int~_Int~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int> D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int> D10<DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int>) D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int>)
(declare-fun pp1<D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>> (D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int>) D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>>)
(declare-fun pp1<D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>> (D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>) D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>)
(declare-fun pp1<D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int>> (D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int> D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int> D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int> D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int> D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int> D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int> D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int> D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int> D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int>) D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int>)
(declare-fun pp1<D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>> (D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>) D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>)
(declare-fun pp1<D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>> (D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>) D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>)
(declare-fun pp1<D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>> (D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>) D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>>)
(declare-const i2<D2<D3<Int~_Bool>~_Int>> D2<D3<Int~_Bool>~_Int>)
(declare-const i3<D2<Int~_D3<Int~_Bool>>> D2<Int~_D3<Int~_Bool>>)
(declare-fun pp1<D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>> (D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>) D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>)
(declare-fun pp1<D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>> (D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>) D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>)
(declare-fun pp1<D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>> (D10<DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>> D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>) D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>>)
(declare-fun pp1<D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>> (D10<DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> D10<DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>>) D10<Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int>)
(declare-fun pp1<D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>> (D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int>) D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>>)
(declare-fun pp1<D10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>>> (D10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>> D10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>> D10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>> D10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>> D10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>> D10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>> D10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int> D10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int> D10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int>) D10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>>)
(declare-fun pp1<D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>> (D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>) D10<Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_DD<Int>>)
(declare-fun pp1<D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>> (D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int> D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int> D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_Int> D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>> D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>>) D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int>)
(declare-fun pp1<D10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int>> (D10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int> D10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int> D10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int> D10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int> D10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int> D10<Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int> D10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>> D10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>> D10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>>) D10<Int~_Int~_Int~_Int~_Int~_Int~_DD<Int>~_Int>)
(declare-const i2<D2<Bool~_Int>> D2<Bool~_Int>)
(declare-const i3<D2<Int~_Bool>> D2<Int~_Bool>)
(declare-const i4<D2<D3<Bool~_Int>~_Bool>> D2<D3<Bool~_Int>~_Bool>)
(declare-fun pp1<D10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_Int>> (D10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_Int> D10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_Int> D10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_Int> D10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_Int> D10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_Int> D10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_Int> D10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_Int> D10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_Int> D10<DD<Int>~_Int~_Int~_Int~_Int~_Int~_Int~_Int>) D10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_Int>)
(declare-fun pp1<D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>> (D10<DD<Int>~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>> D10<DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>) D10<Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>>)
(declare-fun pp1<D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>> (D10<DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_DD<Int>~_Int~_Int~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_Int~_DD<Int>~_DD<Int>> D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int> D10<DD<Int>~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_Int>) D10<Int~_DD<Int>~_DD<Int>~_Int~_Int~_DD<Int>~_Int~_DD<Int>>)
(declare-fun pp1<D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int>> (D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int> D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int> D10<Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int~_Int> D10<Int~_Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int> D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int> D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int> D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int> D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int> D10<DD<Int>~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int>) D10<Int~_Int~_Int~_DD<Int>~_Int~_Int~_Int~_Int>)
(declare-fun pp1<D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>> (D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_DD<Int>~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>> D10<DD<Int>~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_Int~_DD<Int>>) D10<Int~_Int~_Int~_DD<Int>~_DD<Int>~_DD<Int>~_DD<Int>~_Int>)
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
; ---------- m1 ----------
(declare-const x@0@01 Int)
(declare-const r@1@01 D10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_Int>)
(declare-const x@2@01 Int)
(declare-const r@3@01 D10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_Int>)
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
(pop) ; 2
(pop) ; 1
; ---------- m ----------
(declare-const x@4@01 D2<Int~_Bool>)
(declare-const r@5@01 D3<Bool~_Bool>)
(declare-const x@6@01 D2<Int~_Bool>)
(declare-const r@7@01 D3<Bool~_Bool>)
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
; var y: D10[Int, Int, Int, Int, Int, Int, Int, Int]
(declare-const y@8@01 D10<Int~_Int~_Int~_Int~_Int~_Int~_Int~_Int>)
(pop) ; 2
(pop) ; 1
