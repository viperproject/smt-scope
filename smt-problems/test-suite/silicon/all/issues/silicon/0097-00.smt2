(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:51:00
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0097.vpr
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
(declare-sort Seq<Int> 0)
(declare-sort GlobalKPermission 0)
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
(declare-fun $SortWrappers.Seq<Int>To$Snap (Seq<Int>) $Snap)
(declare-fun $SortWrappers.$SnapToSeq<Int> ($Snap) Seq<Int>)
(assert (forall ((x Seq<Int>)) (!
    (= x ($SortWrappers.$SnapToSeq<Int>($SortWrappers.Seq<Int>To$Snap x)))
    :pattern (($SortWrappers.Seq<Int>To$Snap x))
    :qid |$Snap.$SnapToSeq<Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Seq<Int>To$Snap($SortWrappers.$SnapToSeq<Int> x)))
    :pattern (($SortWrappers.$SnapToSeq<Int> x))
    :qid |$Snap.Seq<Int>To$SnapToSeq<Int>|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.GlobalKPermissionTo$Snap (GlobalKPermission) $Snap)
(declare-fun $SortWrappers.$SnapToGlobalKPermission ($Snap) GlobalKPermission)
(assert (forall ((x GlobalKPermission)) (!
    (= x ($SortWrappers.$SnapToGlobalKPermission($SortWrappers.GlobalKPermissionTo$Snap x)))
    :pattern (($SortWrappers.GlobalKPermissionTo$Snap x))
    :qid |$Snap.$SnapToGlobalKPermissionTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.GlobalKPermissionTo$Snap($SortWrappers.$SnapToGlobalKPermission x)))
    :pattern (($SortWrappers.$SnapToGlobalKPermission x))
    :qid |$Snap.GlobalKPermissionTo$SnapToGlobalKPermission|
    )))
; ////////// Symbols
(declare-fun Seq_length (Seq<Int>) Int)
(declare-const Seq_empty Seq<Int>)
(declare-fun Seq_singleton (Int) Seq<Int>)
(declare-fun Seq_append (Seq<Int> Seq<Int>) Seq<Int>)
(declare-fun Seq_index (Seq<Int> Int) Int)
(declare-fun Seq_add (Int Int) Int)
(declare-fun Seq_sub (Int Int) Int)
(declare-fun Seq_update (Seq<Int> Int Int) Seq<Int>)
(declare-fun Seq_take (Seq<Int> Int) Seq<Int>)
(declare-fun Seq_drop (Seq<Int> Int) Seq<Int>)
(declare-fun Seq_contains (Seq<Int> Int) Bool)
(declare-fun Seq_contains_trigger (Seq<Int> Int) Bool)
(declare-fun Seq_skolem (Seq<Int> Int) Int)
(declare-fun Seq_equal (Seq<Int> Seq<Int>) Bool)
(declare-fun Seq_skolem_diff (Seq<Int> Seq<Int>) Int)
(declare-fun Seq_range (Int Int) Seq<Int>)
(declare-const globalK$<Perm> $Perm)
; Declaring symbols related to program functions (from program analysis)
(declare-fun PseudoListget$ ($Snap $Ref Int) Bool)
(declare-fun PseudoListget$%limited ($Snap $Ref Int) Bool)
(declare-fun PseudoListget$%stateless ($Ref Int) Bool)
(declare-fun PseudoListget$%precondition ($Snap $Ref Int) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun PseudoList$MonitorInvariant%trigger ($Snap $Ref) Bool)
(declare-fun PseudoListinv$%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
(assert true)
; ////////// Axioms
(assert (forall ((s Seq<Int>)) (!
  (<= 0 (Seq_length s))
  :pattern ((Seq_length s))
  )))
(assert (= (Seq_length (as Seq_empty  Seq<Int>)) 0))
(assert (forall ((s Seq<Int>)) (!
  (=> (= (Seq_length s) 0) (= s (as Seq_empty  Seq<Int>)))
  :pattern ((Seq_length s))
  )))
(assert (forall ((e Int)) (!
  (= (Seq_length (Seq_singleton e)) 1)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Int>) (s1 Seq<Int>)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Int>)))
      (not (= s1 (as Seq_empty  Seq<Int>))))
    (= (Seq_length (Seq_append s0 s1)) (+ (Seq_length s0) (Seq_length s1))))
  :pattern ((Seq_length (Seq_append s0 s1)))
  )))
(assert (forall ((s0 Seq<Int>) (s1 Seq<Int>)) (!
  (and
    (=> (= s0 (as Seq_empty  Seq<Int>)) (= (Seq_append s0 s1) s1))
    (=> (= s1 (as Seq_empty  Seq<Int>)) (= (Seq_append s0 s1) s0)))
  :pattern ((Seq_append s0 s1))
  )))
(assert (forall ((e Int)) (!
  (= (Seq_index (Seq_singleton e) 0) e)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((i Int) (j Int)) (!
  (= (Seq_add i j) (+ i j))
  :pattern ((Seq_add i j))
  )))
(assert (forall ((i Int) (j Int)) (!
  (= (Seq_sub i j) (- i j))
  :pattern ((Seq_sub i j))
  )))
(assert (forall ((s0 Seq<Int>) (s1 Seq<Int>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Int>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Int>)))
        (and (<= 0 n) (< n (Seq_length s0)))))
    (= (Seq_index (Seq_append s0 s1) n) (Seq_index s0 n)))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  :pattern ((Seq_index s0 n) (Seq_append s0 s1))
  )))
(assert (forall ((s0 Seq<Int>) (s1 Seq<Int>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Int>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Int>)))
        (and (<= (Seq_length s0) n) (< n (Seq_length (Seq_append s0 s1))))))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s0)) (Seq_length s0)) n)
      (=
        (Seq_index (Seq_append s0 s1) n)
        (Seq_index s1 (Seq_sub n (Seq_length s0))))))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  )))
(assert (forall ((s0 Seq<Int>) (s1 Seq<Int>) (m Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Int>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Int>)))
        (and (<= 0 m) (< m (Seq_length s1)))))
    (and
      (= (Seq_sub (Seq_add m (Seq_length s0)) (Seq_length s0)) m)
      (=
        (Seq_index (Seq_append s0 s1) (Seq_add m (Seq_length s0)))
        (Seq_index s1 m))))
  :pattern ((Seq_index s1 m) (Seq_append s0 s1))
  )))
(assert (forall ((s Seq<Int>) (i Int) (v Int)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (= (Seq_length (Seq_update s i v)) (Seq_length s)))
  :pattern ((Seq_length (Seq_update s i v)))
  :pattern ((Seq_length s) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Int>) (i Int) (v Int) (n Int)) (!
  (=>
    (and (<= 0 n) (< n (Seq_length s)))
    (and
      (=> (= i n) (= (Seq_index (Seq_update s i v) n) v))
      (=> (not (= i n)) (= (Seq_index (Seq_update s i v) n) (Seq_index s n)))))
  :pattern ((Seq_index (Seq_update s i v) n))
  :pattern ((Seq_index s n) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Int>) (n Int)) (!
  (and
    (=>
      (<= 0 n)
      (and
        (=> (<= n (Seq_length s)) (= (Seq_length (Seq_take s n)) n))
        (=> (< (Seq_length s) n) (= (Seq_length (Seq_take s n)) (Seq_length s)))))
    (=> (< n 0) (= (Seq_length (Seq_take s n)) 0)))
  :pattern ((Seq_length (Seq_take s n)))
  :pattern ((Seq_take s n) (Seq_length s))
  )))
(assert (forall ((s Seq<Int>) (n Int) (j Int)) (!
  (=>
    (and (<= 0 j) (and (< j n) (< j (Seq_length s))))
    (= (Seq_index (Seq_take s n) j) (Seq_index s j)))
  :pattern ((Seq_index (Seq_take s n) j))
  :pattern ((Seq_index s j) (Seq_take s n))
  )))
(assert (forall ((s Seq<Int>) (n Int)) (!
  (and
    (=>
      (<= 0 n)
      (and
        (=>
          (<= n (Seq_length s))
          (= (Seq_length (Seq_drop s n)) (- (Seq_length s) n)))
        (=> (< (Seq_length s) n) (= (Seq_length (Seq_drop s n)) 0))))
    (=> (< n 0) (= (Seq_length (Seq_drop s n)) (Seq_length s))))
  :pattern ((Seq_length (Seq_drop s n)))
  :pattern ((Seq_length s) (Seq_drop s n))
  )))
(assert (forall ((s Seq<Int>) (n Int) (j Int)) (!
  (=>
    (and (< 0 n) (and (<= 0 j) (< j (- (Seq_length s) n))))
    (and
      (= (Seq_sub (Seq_add j n) n) j)
      (= (Seq_index (Seq_drop s n) j) (Seq_index s (Seq_add j n)))))
  :pattern ((Seq_index (Seq_drop s n) j))
  )))
(assert (forall ((s Seq<Int>) (n Int) (i Int)) (!
  (=>
    (and (< 0 n) (and (<= n i) (< i (Seq_length s))))
    (and
      (= (Seq_add (Seq_sub i n) n) i)
      (= (Seq_index (Seq_drop s n) (Seq_sub i n)) (Seq_index s i))))
  :pattern ((Seq_drop s n) (Seq_index s i))
  )))
(assert (forall ((s Seq<Int>) (t Seq<Int>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_take (Seq_append s t) n) (Seq_take s n)))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Int>) (t Seq<Int>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (=
        (Seq_take (Seq_append s t) n)
        (Seq_append s (Seq_take t (Seq_sub n (Seq_length s)))))))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Int>) (t Seq<Int>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_drop (Seq_append s t) n) (Seq_append (Seq_drop s n) t)))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Int>) (t Seq<Int>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (= (Seq_drop (Seq_append s t) n) (Seq_drop t (Seq_sub n (Seq_length s))))))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Int>) (n Int)) (!
  (=> (<= n 0) (= (Seq_take s n) (as Seq_empty  Seq<Int>)))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Int>) (n Int)) (!
  (=> (<= n 0) (= (Seq_drop s n) s))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Int>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_take s n) s))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Int>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_drop s n) (as Seq_empty  Seq<Int>)))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Int>) (x Int)) (!
  (=>
    (Seq_contains s x)
    (and
      (<= 0 (Seq_skolem s x))
      (and
        (< (Seq_skolem s x) (Seq_length s))
        (= (Seq_index s (Seq_skolem s x)) x))))
  :pattern ((Seq_contains s x))
  )))
(assert (forall ((s Seq<Int>) (x Int) (i Int)) (!
  (=>
    (and (<= 0 i) (and (< i (Seq_length s)) (= (Seq_index s i) x)))
    (Seq_contains s x))
  :pattern ((Seq_contains s x) (Seq_index s i))
  )))
(assert (forall ((s Seq<Int>) (i Int)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (Seq_contains_trigger s (Seq_index s i)))
  :pattern ((Seq_index s i))
  )))
(assert (forall ((s0 Seq<Int>) (s1 Seq<Int>)) (!
  (or
    (and (= s0 s1) (Seq_equal s0 s1))
    (or
      (and
        (not (= s0 s1))
        (and (not (Seq_equal s0 s1)) (not (= (Seq_length s0) (Seq_length s1)))))
      (and
        (not (= s0 s1))
        (and
          (not (Seq_equal s0 s1))
          (and
            (= (Seq_length s0) (Seq_length s1))
            (and
              (= (Seq_skolem_diff s0 s1) (Seq_skolem_diff s1 s0))
              (and
                (<= 0 (Seq_skolem_diff s0 s1))
                (and
                  (< (Seq_skolem_diff s0 s1) (Seq_length s0))
                  (not
                    (=
                      (Seq_index s0 (Seq_skolem_diff s0 s1))
                      (Seq_index s1 (Seq_skolem_diff s0 s1))))))))))))
  :pattern ((Seq_equal s0 s1))
  )))
(assert (forall ((a Seq<Int>) (b Seq<Int>)) (!
  (=> (Seq_equal a b) (= a b))
  :pattern ((Seq_equal a b))
  )))
(assert (forall ((x Int) (y Int)) (!
  (= (Seq_contains (Seq_singleton x) y) (= x y))
  :pattern ((Seq_contains (Seq_singleton x) y))
  )))
(assert (forall ((min_ Int) (max Int)) (!
  (and
    (=> (< min_ max) (= (Seq_length (Seq_range min_ max)) (- max min_)))
    (=> (<= max min_) (= (Seq_length (Seq_range min_ max)) 0)))
  :pattern ((Seq_length (Seq_range min_ max)))
  :qid |$Seq[Int]_prog.ranged_seq_length|)))
(assert (forall ((min_ Int) (max Int) (j Int)) (!
  (=>
    (and (<= 0 j) (< j (- max min_)))
    (= (Seq_index (Seq_range min_ max) j) (+ min_ j)))
  :pattern ((Seq_index (Seq_range min_ max) j))
  :qid |$Seq[Int]_prog.ranged_seq_index|)))
(assert (forall ((min_ Int) (max Int) (v Int)) (!
  (= (Seq_contains (Seq_range min_ max) v) (and (<= min_ v) (< v max)))
  :pattern ((Seq_contains (Seq_range min_ max) v))
  :qid |$Seq[Int]_prog.ranged_seq_contains|)))
(assert (and
  (> (as globalK$<Perm>  $Perm) $Perm.No)
  (> $Perm.Write (as globalK$<Perm>  $Perm))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun $k@3@00 () $Perm)
(declare-fun $k@4@00 () $Perm)
(declare-fun $k@5@00 () $Perm)
(declare-fun $k@6@00 () $Perm)
(assert (forall ((s@$ $Snap) (this$_2@0@00 $Ref) (index@1@00 Int)) (!
  (=
    (PseudoListget$%limited s@$ this$_2@0@00 index@1@00)
    (PseudoListget$ s@$ this$_2@0@00 index@1@00))
  :pattern ((PseudoListget$ s@$ this$_2@0@00 index@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (this$_2@0@00 $Ref) (index@1@00 Int)) (!
  (PseudoListget$%stateless this$_2@0@00 index@1@00)
  :pattern ((PseudoListget$%limited s@$ this$_2@0@00 index@1@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (this$_2@0@00 $Ref) (index@1@00 Int)) (!
  (and
    ($Perm.isReadVar $k@3@00)
    ($Perm.isReadVar $k@4@00)
    ($Perm.isReadVar $k@5@00)
    ($Perm.isReadVar $k@6@00)
    (=>
      (PseudoListget$%precondition s@$ this$_2@0@00 index@1@00)
      (=
        (PseudoListget$ s@$ this$_2@0@00 index@1@00)
        (ite
          (= index@1@00 0)
          true
          (PseudoListget$%limited ($Snap.combine
            $Snap.unit
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) (-
            index@1@00
            1))))))
  :pattern ((PseudoListget$ s@$ this$_2@0@00 index@1@00))
  :pattern ((PseudoListget$%stateless this$_2@0@00 index@1@00) (PseudoListinv$%trigger ($Snap.second s@$) this$_2@0@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (this$_2@0@00 $Ref) (index@1@00 Int)) (!
  (=>
    (PseudoListget$%precondition s@$ this$_2@0@00 index@1@00)
    (ite
      (= index@1@00 0)
      true
      (PseudoListget$%precondition ($Snap.combine
        $Snap.unit
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) (-
        index@1@00
        1))))
  :pattern ((PseudoListget$ s@$ this$_2@0@00 index@1@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- PseudoListstatic_range_workaround$ ----------
(declare-const this$_1@0@01 $Ref)
(declare-const k$@1@01 $Perm)
(declare-const this$_1@2@01 $Ref)
(declare-const k$@3@01 $Perm)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (= ($Snap.first $t@4@01) $Snap.unit))
; [eval] this$_1 != null
(assert (not (= this$_1@2@01 $Ref.null)))
(assert (=
  ($Snap.second $t@4@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@4@01))
    ($Snap.second ($Snap.second $t@4@01)))))
(assert (= ($Snap.first ($Snap.second $t@4@01)) $Snap.unit))
; [eval] k$ > none
(assert (> k$@3@01 $Perm.No))
(assert (=
  ($Snap.second ($Snap.second $t@4@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@4@01))) $Snap.unit))
; [eval] write > k$
(assert (> $Perm.Write k$@3@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@5@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; var n$: Ref
(declare-const n$@6@01 $Ref)
; [exec]
; var a$: Ref
(declare-const a$@7@01 $Ref)
; [exec]
; var b$: Ref
(declare-const b$@8@01 $Ref)
; [exec]
; var c$: Ref
(declare-const c$@9@01 $Ref)
; [exec]
; inhale PseudoListget$(this$_1, 0)
(declare-const $t@10@01 $Snap)
(assert (= $t@10@01 $Snap.unit))
; [eval] PseudoListget$(this$_1, 0)
(push) ; 3
; [eval] this$_2 != null
(declare-const $k@11@01 $Perm)
(assert ($Perm.isReadVar $k@11@01))
(assert (< $k@11@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@11@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@11@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (PseudoListget$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) this$_1@2@01 0))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@11@01))
(assert (and
  (< $k@11@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@11@01))
  (PseudoListget$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) this$_1@2@01 0)))
(assert (PseudoListget$ ($Snap.combine
  $Snap.unit
  ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) this$_1@2@01 0))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int ::
;     { (i in [1..4)) }
;     { PseudoListget$(this$_1, i) }
;     true && (i in [1..4)) ==> PseudoListget$(this$_1, i))
(declare-const $t@12@01 $Snap)
(assert (= $t@12@01 $Snap.unit))
; [eval] (forall i: Int :: { (i in [1..4)) } { PseudoListget$(this$_1, i) } true && (i in [1..4)) ==> PseudoListget$(this$_1, i))
(declare-const i@13@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] true && (i in [1..4)) ==> PseudoListget$(this$_1, i)
; [eval] true && (i in [1..4))
(push) ; 4
; [then-branch: 0 | False | live]
; [else-branch: 0 | True | live]
(push) ; 5
; [then-branch: 0 | False]
(assert false)
(pop) ; 5
(push) ; 5
; [else-branch: 0 | True]
; [eval] (i in [1..4))
; [eval] [1..4)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 1 | i@13@01 in [1..4] | live]
; [else-branch: 1 | !(i@13@01 in [1..4]) | live]
(push) ; 5
; [then-branch: 1 | i@13@01 in [1..4]]
(assert (Seq_contains (Seq_range 1 4) i@13@01))
; [eval] PseudoListget$(this$_1, i)
(push) ; 6
; [eval] this$_2 != null
(declare-const $k@14@01 $Perm)
(assert ($Perm.isReadVar $k@14@01))
(assert (< $k@14@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@14@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@14@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (PseudoListget$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) this$_1@2@01 i@13@01))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@14@01))
(assert (and
  (< $k@14@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@14@01))
  (PseudoListget$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) this$_1@2@01 i@13@01)))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 1 | !(i@13@01 in [1..4])]
(assert (not (Seq_contains (Seq_range 1 4) i@13@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@14@01))
(assert (=>
  (Seq_contains (Seq_range 1 4) i@13@01)
  (and
    (Seq_contains (Seq_range 1 4) i@13@01)
    (< $k@14@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@14@01))
    (PseudoListget$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) this$_1@2@01 i@13@01))))
; Joined path conditions
(assert (or
  (not (Seq_contains (Seq_range 1 4) i@13@01))
  (Seq_contains (Seq_range 1 4) i@13@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@14@01))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@13@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 1 4) i@13@01)
      (and
        (Seq_contains (Seq_range 1 4) i@13@01)
        (< $k@14@01 $Perm.Write)
        (<= $Perm.No (- $Perm.Write $k@14@01))
        (PseudoListget$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) this$_1@2@01 i@13@01)))
    (or
      (not (Seq_contains (Seq_range 1 4) i@13@01))
      (Seq_contains (Seq_range 1 4) i@13@01)))
  :pattern ((Seq_contains (Seq_range 1 4) i@13@01))
  :pattern ((Seq_contains_trigger (Seq_range 1 4) i@13@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0097.vpr@52@11@52@80-aux|)))
(assert (forall ((i@13@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 1 4) i@13@01)
      (and
        (Seq_contains (Seq_range 1 4) i@13@01)
        (< $k@14@01 $Perm.Write)
        (<= $Perm.No (- $Perm.Write $k@14@01))
        (PseudoListget$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) this$_1@2@01 i@13@01)))
    (or
      (not (Seq_contains (Seq_range 1 4) i@13@01))
      (Seq_contains (Seq_range 1 4) i@13@01)))
  :pattern ((Seq_contains_trigger (Seq_range 1 4) i@13@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0097.vpr@52@11@52@80-aux|)))
(assert (forall ((i@13@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 1 4) i@13@01)
      (and
        (Seq_contains (Seq_range 1 4) i@13@01)
        (< $k@14@01 $Perm.Write)
        (<= $Perm.No (- $Perm.Write $k@14@01))
        (PseudoListget$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) this$_1@2@01 i@13@01)))
    (or
      (not (Seq_contains (Seq_range 1 4) i@13@01))
      (Seq_contains (Seq_range 1 4) i@13@01)))
  :pattern ((PseudoListget$%limited ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) this$_1@2@01 i@13@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0097.vpr@52@11@52@80-aux|)))
(assert (forall ((i@13@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 1 4) i@13@01)
    (PseudoListget$ ($Snap.combine
      $Snap.unit
      ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) this$_1@2@01 i@13@01))
  :pattern ((Seq_contains (Seq_range 1 4) i@13@01))
  :pattern ((Seq_contains_trigger (Seq_range 1 4) i@13@01))
  :pattern ((PseudoListget$%limited ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) this$_1@2@01 i@13@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0097.vpr@52@11@52@80|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (forall i: Int ::
;     { (i in [0..4)) }
;     { PseudoListget$(this$_1, i) }
;     true && (i in [0..4)) ==> PseudoListget$(this$_1, i))
; [eval] (forall i: Int :: { (i in [0..4)) } { PseudoListget$(this$_1, i) } true && (i in [0..4)) ==> PseudoListget$(this$_1, i))
(declare-const i@15@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] true && (i in [0..4)) ==> PseudoListget$(this$_1, i)
; [eval] true && (i in [0..4))
(push) ; 4
; [then-branch: 2 | False | live]
; [else-branch: 2 | True | live]
(push) ; 5
; [then-branch: 2 | False]
(assert false)
(pop) ; 5
(push) ; 5
; [else-branch: 2 | True]
; [eval] (i in [0..4))
; [eval] [0..4)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
; [then-branch: 3 | i@15@01 in [0..4] | live]
; [else-branch: 3 | !(i@15@01 in [0..4]) | live]
(push) ; 5
; [then-branch: 3 | i@15@01 in [0..4]]
(assert (Seq_contains (Seq_range 0 4) i@15@01))
; [eval] PseudoListget$(this$_1, i)
(push) ; 6
; [eval] this$_2 != null
(declare-const $k@16@01 $Perm)
(assert ($Perm.isReadVar $k@16@01))
(assert (< $k@16@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@16@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@16@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (PseudoListget$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) this$_1@2@01 i@15@01))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@16@01))
(assert (and
  (< $k@16@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@16@01))
  (PseudoListget$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) this$_1@2@01 i@15@01)))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 3 | !(i@15@01 in [0..4])]
(assert (not (Seq_contains (Seq_range 0 4) i@15@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@16@01))
(assert (=>
  (Seq_contains (Seq_range 0 4) i@15@01)
  (and
    (Seq_contains (Seq_range 0 4) i@15@01)
    (< $k@16@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@16@01))
    (PseudoListget$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) this$_1@2@01 i@15@01))))
; Joined path conditions
(assert (or
  (not (Seq_contains (Seq_range 0 4) i@15@01))
  (Seq_contains (Seq_range 0 4) i@15@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@16@01))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@15@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 4) i@15@01)
      (and
        (Seq_contains (Seq_range 0 4) i@15@01)
        (< $k@16@01 $Perm.Write)
        (<= $Perm.No (- $Perm.Write $k@16@01))
        (PseudoListget$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) this$_1@2@01 i@15@01)))
    (or
      (not (Seq_contains (Seq_range 0 4) i@15@01))
      (Seq_contains (Seq_range 0 4) i@15@01)))
  :pattern ((Seq_contains (Seq_range 0 4) i@15@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 4) i@15@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0097.vpr@53@11@53@80-aux|)))
(assert (forall ((i@15@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 4) i@15@01)
      (and
        (Seq_contains (Seq_range 0 4) i@15@01)
        (< $k@16@01 $Perm.Write)
        (<= $Perm.No (- $Perm.Write $k@16@01))
        (PseudoListget$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) this$_1@2@01 i@15@01)))
    (or
      (not (Seq_contains (Seq_range 0 4) i@15@01))
      (Seq_contains (Seq_range 0 4) i@15@01)))
  :pattern ((Seq_contains_trigger (Seq_range 0 4) i@15@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0097.vpr@53@11@53@80-aux|)))
(assert (forall ((i@15@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 4) i@15@01)
      (and
        (Seq_contains (Seq_range 0 4) i@15@01)
        (< $k@16@01 $Perm.Write)
        (<= $Perm.No (- $Perm.Write $k@16@01))
        (PseudoListget$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) this$_1@2@01 i@15@01)))
    (or
      (not (Seq_contains (Seq_range 0 4) i@15@01))
      (Seq_contains (Seq_range 0 4) i@15@01)))
  :pattern ((PseudoListget$%limited ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) this$_1@2@01 i@15@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0097.vpr@53@11@53@80-aux|)))
(assert (forall ((i@15@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 4) i@15@01)
    (PseudoListget$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) this$_1@2@01 i@15@01))
  :pattern ((Seq_contains (Seq_range 0 4) i@15@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 4) i@15@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 4) i@15@01))
  :pattern ((PseudoListget$%limited ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) this$_1@2@01 i@15@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0097.vpr@53@11@53@80_precondition|)))
(push) ; 3
(assert (not (forall ((i@15@01 Int)) (!
  (=>
    (and
      (=>
        (Seq_contains (Seq_range 0 4) i@15@01)
        (PseudoListget$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) this$_1@2@01 i@15@01))
      (Seq_contains (Seq_range 0 4) i@15@01))
    (PseudoListget$ ($Snap.combine
      $Snap.unit
      ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) this$_1@2@01 i@15@01))
  :pattern ((Seq_contains (Seq_range 0 4) i@15@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 4) i@15@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 4) i@15@01))
  :pattern ((PseudoListget$%limited ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) this$_1@2@01 i@15@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0097.vpr@53@11@53@80|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@15@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 4) i@15@01)
    (PseudoListget$ ($Snap.combine
      $Snap.unit
      ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) this$_1@2@01 i@15@01))
  :pattern ((Seq_contains (Seq_range 0 4) i@15@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 4) i@15@01))
  :pattern ((PseudoListget$%limited ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) this$_1@2@01 i@15@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0097.vpr@53@11@53@80|)))
(pop) ; 2
(pop) ; 1
