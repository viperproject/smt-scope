(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:47:13
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/carbon/0076.vpr
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
(declare-sort Seq<$Ref> 0)
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
(declare-fun $SortWrappers.Seq<$Ref>To$Snap (Seq<$Ref>) $Snap)
(declare-fun $SortWrappers.$SnapToSeq<$Ref> ($Snap) Seq<$Ref>)
(assert (forall ((x Seq<$Ref>)) (!
    (= x ($SortWrappers.$SnapToSeq<$Ref>($SortWrappers.Seq<$Ref>To$Snap x)))
    :pattern (($SortWrappers.Seq<$Ref>To$Snap x))
    :qid |$Snap.$SnapToSeq<$Ref>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Seq<$Ref>To$Snap($SortWrappers.$SnapToSeq<$Ref> x)))
    :pattern (($SortWrappers.$SnapToSeq<$Ref> x))
    :qid |$Snap.Seq<$Ref>To$SnapToSeq<$Ref>|
    )))
; ////////// Symbols
(declare-fun Seq_length (Seq<$Ref>) Int)
(declare-const Seq_empty Seq<$Ref>)
(declare-fun Seq_singleton ($Ref) Seq<$Ref>)
(declare-fun Seq_append (Seq<$Ref> Seq<$Ref>) Seq<$Ref>)
(declare-fun Seq_index (Seq<$Ref> Int) $Ref)
(declare-fun Seq_add (Int Int) Int)
(declare-fun Seq_sub (Int Int) Int)
(declare-fun Seq_update (Seq<$Ref> Int $Ref) Seq<$Ref>)
(declare-fun Seq_take (Seq<$Ref> Int) Seq<$Ref>)
(declare-fun Seq_drop (Seq<$Ref> Int) Seq<$Ref>)
(declare-fun Seq_contains (Seq<$Ref> $Ref) Bool)
(declare-fun Seq_contains_trigger (Seq<$Ref> $Ref) Bool)
(declare-fun Seq_skolem (Seq<$Ref> $Ref) Int)
(declare-fun Seq_equal (Seq<$Ref> Seq<$Ref>) Bool)
(declare-fun Seq_skolem_diff (Seq<$Ref> Seq<$Ref>) Int)
; Declaring symbols related to program functions (from program analysis)
(declare-fun prio ($Snap $Ref) Int)
(declare-fun prio%limited ($Snap $Ref) Int)
(declare-fun prio%stateless ($Ref) Bool)
(declare-fun prio%precondition ($Snap $Ref) Bool)
(declare-fun contentNodes ($Snap $Ref $Ref) Seq<$Ref>)
(declare-fun contentNodes%limited ($Snap $Ref $Ref) Seq<$Ref>)
(declare-fun contentNodes%stateless ($Ref $Ref) Bool)
(declare-fun contentNodes%precondition ($Snap $Ref $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun Lseg%trigger ($Snap $Ref $Ref) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((s Seq<$Ref>)) (!
  (<= 0 (Seq_length s))
  :pattern ((Seq_length s))
  )))
(assert (= (Seq_length (as Seq_empty  Seq<$Ref>)) 0))
(assert (forall ((s Seq<$Ref>)) (!
  (=> (= (Seq_length s) 0) (= s (as Seq_empty  Seq<$Ref>)))
  :pattern ((Seq_length s))
  )))
(assert (forall ((e $Ref)) (!
  (= (Seq_length (Seq_singleton e)) 1)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<$Ref>) (s1 Seq<$Ref>)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<$Ref>)))
      (not (= s1 (as Seq_empty  Seq<$Ref>))))
    (= (Seq_length (Seq_append s0 s1)) (+ (Seq_length s0) (Seq_length s1))))
  :pattern ((Seq_length (Seq_append s0 s1)))
  )))
(assert (forall ((s0 Seq<$Ref>) (s1 Seq<$Ref>)) (!
  (and
    (=> (= s0 (as Seq_empty  Seq<$Ref>)) (= (Seq_append s0 s1) s1))
    (=> (= s1 (as Seq_empty  Seq<$Ref>)) (= (Seq_append s0 s1) s0)))
  :pattern ((Seq_append s0 s1))
  )))
(assert (forall ((e $Ref)) (!
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
(assert (forall ((s0 Seq<$Ref>) (s1 Seq<$Ref>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<$Ref>)))
      (and
        (not (= s1 (as Seq_empty  Seq<$Ref>)))
        (and (<= 0 n) (< n (Seq_length s0)))))
    (= (Seq_index (Seq_append s0 s1) n) (Seq_index s0 n)))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  :pattern ((Seq_index s0 n) (Seq_append s0 s1))
  )))
(assert (forall ((s0 Seq<$Ref>) (s1 Seq<$Ref>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<$Ref>)))
      (and
        (not (= s1 (as Seq_empty  Seq<$Ref>)))
        (and (<= (Seq_length s0) n) (< n (Seq_length (Seq_append s0 s1))))))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s0)) (Seq_length s0)) n)
      (=
        (Seq_index (Seq_append s0 s1) n)
        (Seq_index s1 (Seq_sub n (Seq_length s0))))))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  )))
(assert (forall ((s0 Seq<$Ref>) (s1 Seq<$Ref>) (m Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<$Ref>)))
      (and
        (not (= s1 (as Seq_empty  Seq<$Ref>)))
        (and (<= 0 m) (< m (Seq_length s1)))))
    (and
      (= (Seq_sub (Seq_add m (Seq_length s0)) (Seq_length s0)) m)
      (=
        (Seq_index (Seq_append s0 s1) (Seq_add m (Seq_length s0)))
        (Seq_index s1 m))))
  :pattern ((Seq_index s1 m) (Seq_append s0 s1))
  )))
(assert (forall ((s Seq<$Ref>) (i Int) (v $Ref)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (= (Seq_length (Seq_update s i v)) (Seq_length s)))
  :pattern ((Seq_length (Seq_update s i v)))
  :pattern ((Seq_length s) (Seq_update s i v))
  )))
(assert (forall ((s Seq<$Ref>) (i Int) (v $Ref) (n Int)) (!
  (=>
    (and (<= 0 n) (< n (Seq_length s)))
    (and
      (=> (= i n) (= (Seq_index (Seq_update s i v) n) v))
      (=> (not (= i n)) (= (Seq_index (Seq_update s i v) n) (Seq_index s n)))))
  :pattern ((Seq_index (Seq_update s i v) n))
  :pattern ((Seq_index s n) (Seq_update s i v))
  )))
(assert (forall ((s Seq<$Ref>) (n Int)) (!
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
(assert (forall ((s Seq<$Ref>) (n Int) (j Int)) (!
  (=>
    (and (<= 0 j) (and (< j n) (< j (Seq_length s))))
    (= (Seq_index (Seq_take s n) j) (Seq_index s j)))
  :pattern ((Seq_index (Seq_take s n) j))
  :pattern ((Seq_index s j) (Seq_take s n))
  )))
(assert (forall ((s Seq<$Ref>) (n Int)) (!
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
(assert (forall ((s Seq<$Ref>) (n Int) (j Int)) (!
  (=>
    (and (< 0 n) (and (<= 0 j) (< j (- (Seq_length s) n))))
    (and
      (= (Seq_sub (Seq_add j n) n) j)
      (= (Seq_index (Seq_drop s n) j) (Seq_index s (Seq_add j n)))))
  :pattern ((Seq_index (Seq_drop s n) j))
  )))
(assert (forall ((s Seq<$Ref>) (n Int) (i Int)) (!
  (=>
    (and (< 0 n) (and (<= n i) (< i (Seq_length s))))
    (and
      (= (Seq_add (Seq_sub i n) n) i)
      (= (Seq_index (Seq_drop s n) (Seq_sub i n)) (Seq_index s i))))
  :pattern ((Seq_drop s n) (Seq_index s i))
  )))
(assert (forall ((s Seq<$Ref>) (t Seq<$Ref>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_take (Seq_append s t) n) (Seq_take s n)))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<$Ref>) (t Seq<$Ref>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (=
        (Seq_take (Seq_append s t) n)
        (Seq_append s (Seq_take t (Seq_sub n (Seq_length s)))))))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<$Ref>) (t Seq<$Ref>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_drop (Seq_append s t) n) (Seq_append (Seq_drop s n) t)))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<$Ref>) (t Seq<$Ref>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (= (Seq_drop (Seq_append s t) n) (Seq_drop t (Seq_sub n (Seq_length s))))))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<$Ref>) (n Int)) (!
  (=> (<= n 0) (= (Seq_take s n) (as Seq_empty  Seq<$Ref>)))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<$Ref>) (n Int)) (!
  (=> (<= n 0) (= (Seq_drop s n) s))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<$Ref>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_take s n) s))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<$Ref>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_drop s n) (as Seq_empty  Seq<$Ref>)))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<$Ref>) (x $Ref)) (!
  (=>
    (Seq_contains s x)
    (and
      (<= 0 (Seq_skolem s x))
      (and
        (< (Seq_skolem s x) (Seq_length s))
        (= (Seq_index s (Seq_skolem s x)) x))))
  :pattern ((Seq_contains s x))
  )))
(assert (forall ((s Seq<$Ref>) (x $Ref) (i Int)) (!
  (=>
    (and (<= 0 i) (and (< i (Seq_length s)) (= (Seq_index s i) x)))
    (Seq_contains s x))
  :pattern ((Seq_contains s x) (Seq_index s i))
  )))
(assert (forall ((s Seq<$Ref>) (i Int)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (Seq_contains_trigger s (Seq_index s i)))
  :pattern ((Seq_index s i))
  )))
(assert (forall ((s0 Seq<$Ref>) (s1 Seq<$Ref>)) (!
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
(assert (forall ((a Seq<$Ref>) (b Seq<$Ref>)) (!
  (=> (Seq_equal a b) (= a b))
  :pattern ((Seq_equal a b))
  )))
(assert (forall ((x $Ref) (y $Ref)) (!
  (= (Seq_contains (Seq_singleton x) y) (= x y))
  :pattern ((Seq_contains (Seq_singleton x) y))
  )))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- FUNCTION prio----------
(declare-fun this@0@00 () $Ref)
(declare-fun result@1@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (= (prio%limited s@$ this@0@00) (prio s@$ this@0@00))
  :pattern ((prio s@$ this@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (prio%stateless this@0@00)
  :pattern ((prio%limited s@$ this@0@00))
  :qid |quant-u-1|)))
; ---------- FUNCTION contentNodes----------
(declare-fun this@2@00 () $Ref)
(declare-fun end@3@00 () $Ref)
(declare-fun result@4@00 () Seq<$Ref>)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const $t@5@00 $Snap)
(assert (= $t@5@00 ($Snap.combine ($Snap.first $t@5@00) ($Snap.second $t@5@00))))
(assert (= ($Snap.first $t@5@00) $Snap.unit))
; [eval] (this == end) == (result == Seq[Ref]())
; [eval] this == end
; [eval] result == Seq[Ref]()
; [eval] Seq[Ref]()
(assert (= (= this@2@00 end@3@00) (Seq_equal result@4@00 (as Seq_empty  Seq<$Ref>))))
(assert (=
  ($Snap.second $t@5@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@5@00))
    ($Snap.second ($Snap.second $t@5@00)))))
(assert (= ($Snap.first ($Snap.second $t@5@00)) $Snap.unit))
; [eval] this != end ==> 0 < |result|
; [eval] this != end
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (= this@2@00 end@3@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= this@2@00 end@3@00))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | this@2@00 != end@3@00 | live]
; [else-branch: 0 | this@2@00 == end@3@00 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | this@2@00 != end@3@00]
(assert (not (= this@2@00 end@3@00)))
; [eval] 0 < |result|
; [eval] |result|
(pop) ; 3
(push) ; 3
; [else-branch: 0 | this@2@00 == end@3@00]
(assert (= this@2@00 end@3@00))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (= this@2@00 end@3@00) (not (= this@2@00 end@3@00))))
(assert (=> (not (= this@2@00 end@3@00)) (< 0 (Seq_length result@4@00))))
(assert (=
  ($Snap.second ($Snap.second $t@5@00))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@5@00)))
    ($Snap.second ($Snap.second ($Snap.second $t@5@00))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@5@00))) $Snap.unit))
; [eval] this != end ==> result[0] == (unfolding acc(Lseg(this, end), write) in this.data)
; [eval] this != end
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (= this@2@00 end@3@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= this@2@00 end@3@00))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | this@2@00 != end@3@00 | live]
; [else-branch: 1 | this@2@00 == end@3@00 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | this@2@00 != end@3@00]
(assert (not (= this@2@00 end@3@00)))
; [eval] result[0] == (unfolding acc(Lseg(this, end), write) in this.data)
; [eval] result[0]
(push) ; 4
(assert (not (< 0 (Seq_length result@4@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] (unfolding acc(Lseg(this, end), write) in this.data)
(push) ; 4
(assert (Lseg%trigger s@$ this@2@00 end@3@00))
; [eval] this != end
(push) ; 5
(set-option :timeout 10)
(assert (not (= this@2@00 end@3@00)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | this@2@00 != end@3@00 | live]
; [else-branch: 2 | this@2@00 == end@3@00 | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 2 | this@2@00 != end@3@00]
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= this@2@00 $Ref.null)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
; [eval] this.next != null
(push) ; 6
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | First:(Second:(s@$)) != Null | live]
; [else-branch: 3 | First:(Second:(s@$)) == Null | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 3 | First:(Second:(s@$)) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] (unfolding acc(Lseg(this.next, end), write) in this.next != end ==> prio(this.data) <= prio(this.next.data))
(push) ; 7
(assert (Lseg%trigger ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))
; [eval] this != end
(push) ; 8
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | First:(Second:(s@$)) != end@3@00 | live]
; [else-branch: 4 | First:(Second:(s@$)) == end@3@00 | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 4 | First:(Second:(s@$)) != end@3@00]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))))
(push) ; 9
(set-option :timeout 10)
(assert (not (= this@2@00 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))))
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= this@2@00 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | First:(Second:(First:(Second:(Second:(s@$))))) != Null | live]
; [else-branch: 5 | First:(Second:(First:(Second:(Second:(s@$))))) == Null | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 5 | First:(Second:(First:(Second:(Second:(s@$))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
  $Snap.unit))
; [eval] (unfolding acc(Lseg(this.next, end), write) in this.next != end ==> prio(this.data) <= prio(this.next.data))
(declare-fun recunf@6@00 ($Snap $Ref $Ref) Bool)
(assert (recunf@6@00 s@$ this@2@00 end@3@00))
; [eval] this.next != end ==> prio(this.data) <= prio(this.next.data)
; [eval] this.next != end
(push) ; 10
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | First:(Second:(s@$)) != end@3@00 | live]
; [else-branch: 6 | First:(Second:(s@$)) == end@3@00 | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 6 | First:(Second:(s@$)) != end@3@00]
; [eval] prio(this.data) <= prio(this.next.data)
; [eval] prio(this.data)
(push) ; 12
(assert (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))
(pop) ; 12
; Joined path conditions
(assert (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))
; [eval] prio(this.next.data)
(push) ; 12
(assert (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))
(pop) ; 12
; Joined path conditions
(assert (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))
  (and
    (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
    (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
(pop) ; 9
(push) ; 9
; [else-branch: 5 | First:(Second:(First:(Second:(Second:(s@$))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
  $Snap.unit))
; [eval] this.next != end ==> prio(this.data) <= prio(this.next.data)
; [eval] this.next != end
(push) ; 10
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | First:(Second:(s@$)) != end@3@00 | live]
; [else-branch: 7 | First:(Second:(s@$)) == end@3@00 | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 7 | First:(Second:(s@$)) != end@3@00]
; [eval] prio(this.data) <= prio(this.next.data)
; [eval] prio(this.data)
(push) ; 12
(assert (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))
(pop) ; 12
; Joined path conditions
(assert (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))
; [eval] prio(this.next.data)
(push) ; 12
(assert (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))
(pop) ; 12
; Joined path conditions
(assert (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))
  (and
    (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
    (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
(pop) ; 9
(pop) ; 8
(push) ; 8
; [else-branch: 4 | First:(Second:(s@$)) == end@3@00]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] this.next != end ==> prio(this.data) <= prio(this.next.data)
; [eval] this.next != end
(push) ; 9
; [then-branch: 8 | First:(Second:(s@$)) != end@3@00 | dead]
; [else-branch: 8 | First:(Second:(s@$)) == end@3@00 | live]
(push) ; 10
; [else-branch: 8 | First:(Second:(s@$)) == end@3@00]
(pop) ; 10
(pop) ; 9
; Joined path conditions
(pop) ; 8
(pop) ; 7
(declare-fun joined_unfolding@7@00 ($Snap $Ref $Ref) Bool)
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
        $Ref.null))
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)))
  (=
    (joined_unfolding@7@00 s@$ this@2@00 end@3@00)
    (=>
      (not
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))
      (<=
        (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
        (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
      $Ref.null)
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)))
  (=
    (joined_unfolding@7@00 s@$ this@2@00 end@3@00)
    (=>
      (not
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))
      (<=
        (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
        (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)
  (= (joined_unfolding@7@00 s@$ this@2@00 end@3@00) true)))
; Joined path conditions
(assert (Lseg%trigger ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))
  (and
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))
    (=
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.combine
        ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))
        ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
    (=
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
        ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))))))
(assert (=>
  (and
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
      $Snap.unit)
    (recunf@6@00 s@$ this@2@00 end@3@00)
    (=>
      (not
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))
      (and
        (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
        (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))))))
; Joined path conditions
(assert (=>
  (and
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
      $Snap.unit)
    (=>
      (not
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))
      (and
        (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
        (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))))))
; Joined path conditions
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)
  (and
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)
    (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))))
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
      $Ref.null)
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
        $Ref.null))
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)))))
(assert (joined_unfolding@7@00 s@$ this@2@00 end@3@00))
(pop) ; 6
(push) ; 6
; [else-branch: 3 | First:(Second:(s@$)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
(assert (= ($Snap.second ($Snap.second s@$)) $Snap.unit))
(pop) ; 6
(pop) ; 5
(pop) ; 4
(declare-fun joined_unfolding@8@00 ($Snap $Ref $Ref) $Ref)
(assert (=>
  (and
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
    (not (= this@2@00 end@3@00)))
  (=
    (joined_unfolding@8@00 s@$ this@2@00 end@3@00)
    ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))))
(assert (=>
  (and
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
    (not (= this@2@00 end@3@00)))
  (=
    (joined_unfolding@8@00 s@$ this@2@00 end@3@00)
    ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))))
; Joined path conditions
(assert (Lseg%trigger s@$ this@2@00 end@3@00))
(assert (=>
  (not (= this@2@00 end@3@00))
  (and
    (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
    (not (= this@2@00 $Ref.null))
    (=
      ($Snap.second s@$)
      ($Snap.combine
        ($Snap.first ($Snap.second s@$))
        ($Snap.second ($Snap.second s@$)))))))
(assert (=>
  (and
    (not (= this@2@00 end@3@00))
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)))
  (and
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
    (=
      ($Snap.second ($Snap.second s@$))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second s@$)))
        ($Snap.second ($Snap.second ($Snap.second s@$)))))
    (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit)
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            end@3@00)))
      (=
        (joined_unfolding@7@00 s@$ this@2@00 end@3@00)
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              end@3@00))
          (<=
            (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
            (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            end@3@00)))
      (=
        (joined_unfolding@7@00 s@$ this@2@00 end@3@00)
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              end@3@00))
          (<=
            (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
            (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))))))))
    (=>
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)
      (= (joined_unfolding@7@00 s@$ this@2@00 end@3@00) true))
    (Lseg%trigger ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)
    (=>
      (not
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            end@3@00))
        (=
          ($Snap.first ($Snap.second ($Snap.second s@$)))
          ($Snap.combine
            ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))
            ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
        (=
          ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
            ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            end@3@00))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
            $Ref.null)))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
            $Ref.null))
        (=
          ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
          $Snap.unit)
        (recunf@6@00 s@$ this@2@00 end@3@00)
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              end@3@00))
          (and
            (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
            (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            end@3@00))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
          $Snap.unit)
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              end@3@00))
          (and
            (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
            (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))))))))
    (=>
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)
      (and
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)
        (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit)))
    (or
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            end@3@00)))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            end@3@00))))
    (joined_unfolding@7@00 s@$ this@2@00 end@3@00))))
; Joined path conditions
(assert (=>
  (and
    (not (= this@2@00 end@3@00))
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
  (and
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
    (= ($Snap.second ($Snap.second s@$)) $Snap.unit))))
(assert (or
  (and
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
    (not (= this@2@00 end@3@00)))
  (and
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
    (not (= this@2@00 end@3@00)))))
(pop) ; 3
(push) ; 3
; [else-branch: 1 | this@2@00 == end@3@00]
(assert (= this@2@00 end@3@00))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=>
  (not (= this@2@00 end@3@00))
  (and
    (not (= this@2@00 end@3@00))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            $Ref.null))
        (not (= this@2@00 end@3@00)))
      (=
        (joined_unfolding@8@00 s@$ this@2@00 end@3@00)
        ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          $Ref.null)
        (not (= this@2@00 end@3@00)))
      (=
        (joined_unfolding@8@00 s@$ this@2@00 end@3@00)
        ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))
    (Lseg%trigger s@$ this@2@00 end@3@00)
    (=>
      (not (= this@2@00 end@3@00))
      (and
        (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
        (not (= this@2@00 $Ref.null))
        (=
          ($Snap.second s@$)
          ($Snap.combine
            ($Snap.first ($Snap.second s@$))
            ($Snap.second ($Snap.second s@$))))))
    (=>
      (and
        (not (= this@2@00 end@3@00))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            $Ref.null)))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            $Ref.null))
        (=
          ($Snap.second ($Snap.second s@$))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second s@$)))
            ($Snap.second ($Snap.second ($Snap.second s@$)))))
        (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit)
        (=>
          (and
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
                $Ref.null))
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                end@3@00)))
          (=
            (joined_unfolding@7@00 s@$ this@2@00 end@3@00)
            (=>
              (not
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                  end@3@00))
              (<=
                (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
                (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))))))))
        (=>
          (and
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
              $Ref.null)
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                end@3@00)))
          (=
            (joined_unfolding@7@00 s@$ this@2@00 end@3@00)
            (=>
              (not
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                  end@3@00))
              (<=
                (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
                (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))))))))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            end@3@00)
          (= (joined_unfolding@7@00 s@$ this@2@00 end@3@00) true))
        (Lseg%trigger ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              end@3@00))
          (and
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                end@3@00))
            (=
              ($Snap.first ($Snap.second ($Snap.second s@$)))
              ($Snap.combine
                ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))
                ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
            (=
              ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
                ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
        (=>
          (and
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                end@3@00))
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
                $Ref.null)))
          (and
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
                $Ref.null))
            (=
              ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
                ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))))
            (=
              ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
              $Snap.unit)
            (recunf@6@00 s@$ this@2@00 end@3@00)
            (=>
              (not
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                  end@3@00))
              (and
                (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
                (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))))))))
        (=>
          (and
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                end@3@00))
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
              $Ref.null))
          (and
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
              $Ref.null)
            (=
              ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
              $Snap.unit)
            (=>
              (not
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                  end@3@00))
              (and
                (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
                (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))))))))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            end@3@00)
          (and
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              end@3@00)
            (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit)))
        (or
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            end@3@00)
          (and
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
              $Ref.null)
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                end@3@00)))
          (and
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
                $Ref.null))
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                end@3@00))))
        (joined_unfolding@7@00 s@$ this@2@00 end@3@00)))
    (=>
      (and
        (not (= this@2@00 end@3@00))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          $Ref.null)
        (= ($Snap.second ($Snap.second s@$)) $Snap.unit)))
    (or
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          $Ref.null)
        (not (= this@2@00 end@3@00)))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            $Ref.null))
        (not (= this@2@00 end@3@00)))))))
; Joined path conditions
(assert (=>
  (not (= this@2@00 end@3@00))
  (= (Seq_index result@4@00 0) (joined_unfolding@8@00 s@$ this@2@00 end@3@00))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@5@00))) $Snap.unit))
; [eval] this != end ==> (forall i: Int, j: Int :: { result[i], prio(result[j]) } { prio(result[i]), result[j] } { prio(result[i]), prio(result[j]) } 0 <= i && (i < j && j < |result|) ==> prio(result[i]) <= prio(result[j]))
; [eval] this != end
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (= this@2@00 end@3@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= this@2@00 end@3@00))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | this@2@00 != end@3@00 | live]
; [else-branch: 9 | this@2@00 == end@3@00 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 9 | this@2@00 != end@3@00]
(assert (not (= this@2@00 end@3@00)))
; [eval] (forall i: Int, j: Int :: { result[i], prio(result[j]) } { prio(result[i]), result[j] } { prio(result[i]), prio(result[j]) } 0 <= i && (i < j && j < |result|) ==> prio(result[i]) <= prio(result[j]))
(declare-const i@9@00 Int)
(declare-const j@10@00 Int)
(push) ; 4
; [eval] 0 <= i && (i < j && j < |result|) ==> prio(result[i]) <= prio(result[j])
; [eval] 0 <= i && (i < j && j < |result|)
; [eval] 0 <= i
(push) ; 5
; [then-branch: 10 | !(0 <= i@9@00) | live]
; [else-branch: 10 | 0 <= i@9@00 | live]
(push) ; 6
; [then-branch: 10 | !(0 <= i@9@00)]
(assert (not (<= 0 i@9@00)))
(pop) ; 6
(push) ; 6
; [else-branch: 10 | 0 <= i@9@00]
(assert (<= 0 i@9@00))
; [eval] i < j
(push) ; 7
; [then-branch: 11 | !(i@9@00 < j@10@00) | live]
; [else-branch: 11 | i@9@00 < j@10@00 | live]
(push) ; 8
; [then-branch: 11 | !(i@9@00 < j@10@00)]
(assert (not (< i@9@00 j@10@00)))
(pop) ; 8
(push) ; 8
; [else-branch: 11 | i@9@00 < j@10@00]
(assert (< i@9@00 j@10@00))
; [eval] j < |result|
; [eval] |result|
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (< i@9@00 j@10@00) (not (< i@9@00 j@10@00))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@9@00)
  (and (<= 0 i@9@00) (or (< i@9@00 j@10@00) (not (< i@9@00 j@10@00))))))
(assert (or (<= 0 i@9@00) (not (<= 0 i@9@00))))
(push) ; 5
; [then-branch: 12 | 0 <= i@9@00 && i@9@00 < j@10@00 && j@10@00 < |result@4@00| | live]
; [else-branch: 12 | !(0 <= i@9@00 && i@9@00 < j@10@00 && j@10@00 < |result@4@00|) | live]
(push) ; 6
; [then-branch: 12 | 0 <= i@9@00 && i@9@00 < j@10@00 && j@10@00 < |result@4@00|]
(assert (and (<= 0 i@9@00) (and (< i@9@00 j@10@00) (< j@10@00 (Seq_length result@4@00)))))
; [eval] prio(result[i]) <= prio(result[j])
; [eval] prio(result[i])
; [eval] result[i]
(push) ; 7
(assert (not (>= i@9@00 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@9@00 (Seq_length result@4@00))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (prio%precondition $Snap.unit (Seq_index result@4@00 i@9@00)))
(pop) ; 7
; Joined path conditions
(assert (prio%precondition $Snap.unit (Seq_index result@4@00 i@9@00)))
; [eval] prio(result[j])
; [eval] result[j]
(push) ; 7
(assert (not (>= j@10@00 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (prio%precondition $Snap.unit (Seq_index result@4@00 j@10@00)))
(pop) ; 7
; Joined path conditions
(assert (prio%precondition $Snap.unit (Seq_index result@4@00 j@10@00)))
(pop) ; 6
(push) ; 6
; [else-branch: 12 | !(0 <= i@9@00 && i@9@00 < j@10@00 && j@10@00 < |result@4@00|)]
(assert (not
  (and
    (<= 0 i@9@00)
    (and (< i@9@00 j@10@00) (< j@10@00 (Seq_length result@4@00))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@9@00)
    (and (< i@9@00 j@10@00) (< j@10@00 (Seq_length result@4@00))))
  (and
    (<= 0 i@9@00)
    (< i@9@00 j@10@00)
    (< j@10@00 (Seq_length result@4@00))
    (prio%precondition $Snap.unit (Seq_index result@4@00 i@9@00))
    (prio%precondition $Snap.unit (Seq_index result@4@00 j@10@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@9@00)
      (and (< i@9@00 j@10@00) (< j@10@00 (Seq_length result@4@00)))))
  (and
    (<= 0 i@9@00)
    (and (< i@9@00 j@10@00) (< j@10@00 (Seq_length result@4@00))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@9@00 Int) (j@10@00 Int)) (!
  (and
    (=>
      (<= 0 i@9@00)
      (and (<= 0 i@9@00) (or (< i@9@00 j@10@00) (not (< i@9@00 j@10@00)))))
    (or (<= 0 i@9@00) (not (<= 0 i@9@00)))
    (=>
      (and
        (<= 0 i@9@00)
        (and (< i@9@00 j@10@00) (< j@10@00 (Seq_length result@4@00))))
      (and
        (<= 0 i@9@00)
        (< i@9@00 j@10@00)
        (< j@10@00 (Seq_length result@4@00))
        (prio%precondition $Snap.unit (Seq_index result@4@00 i@9@00))
        (prio%precondition $Snap.unit (Seq_index result@4@00 j@10@00))))
    (or
      (not
        (and
          (<= 0 i@9@00)
          (and (< i@9@00 j@10@00) (< j@10@00 (Seq_length result@4@00)))))
      (and
        (<= 0 i@9@00)
        (and (< i@9@00 j@10@00) (< j@10@00 (Seq_length result@4@00))))))
  :pattern ((Seq_index result@4@00 i@9@00) (prio%limited $Snap.unit (Seq_index
    result@4@00
    j@10@00)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0076.vpr@27@5@29@43-aux|)))
(assert (forall ((i@9@00 Int) (j@10@00 Int)) (!
  (and
    (=>
      (<= 0 i@9@00)
      (and (<= 0 i@9@00) (or (< i@9@00 j@10@00) (not (< i@9@00 j@10@00)))))
    (or (<= 0 i@9@00) (not (<= 0 i@9@00)))
    (=>
      (and
        (<= 0 i@9@00)
        (and (< i@9@00 j@10@00) (< j@10@00 (Seq_length result@4@00))))
      (and
        (<= 0 i@9@00)
        (< i@9@00 j@10@00)
        (< j@10@00 (Seq_length result@4@00))
        (prio%precondition $Snap.unit (Seq_index result@4@00 i@9@00))
        (prio%precondition $Snap.unit (Seq_index result@4@00 j@10@00))))
    (or
      (not
        (and
          (<= 0 i@9@00)
          (and (< i@9@00 j@10@00) (< j@10@00 (Seq_length result@4@00)))))
      (and
        (<= 0 i@9@00)
        (and (< i@9@00 j@10@00) (< j@10@00 (Seq_length result@4@00))))))
  :pattern ((prio%limited $Snap.unit (Seq_index result@4@00 i@9@00)) (Seq_index
    result@4@00
    j@10@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0076.vpr@27@5@29@43-aux|)))
(assert (forall ((i@9@00 Int) (j@10@00 Int)) (!
  (and
    (=>
      (<= 0 i@9@00)
      (and (<= 0 i@9@00) (or (< i@9@00 j@10@00) (not (< i@9@00 j@10@00)))))
    (or (<= 0 i@9@00) (not (<= 0 i@9@00)))
    (=>
      (and
        (<= 0 i@9@00)
        (and (< i@9@00 j@10@00) (< j@10@00 (Seq_length result@4@00))))
      (and
        (<= 0 i@9@00)
        (< i@9@00 j@10@00)
        (< j@10@00 (Seq_length result@4@00))
        (prio%precondition $Snap.unit (Seq_index result@4@00 i@9@00))
        (prio%precondition $Snap.unit (Seq_index result@4@00 j@10@00))))
    (or
      (not
        (and
          (<= 0 i@9@00)
          (and (< i@9@00 j@10@00) (< j@10@00 (Seq_length result@4@00)))))
      (and
        (<= 0 i@9@00)
        (and (< i@9@00 j@10@00) (< j@10@00 (Seq_length result@4@00))))))
  :pattern ((prio%limited $Snap.unit (Seq_index result@4@00 i@9@00)) (prio%limited $Snap.unit (Seq_index
    result@4@00
    j@10@00)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0076.vpr@27@5@29@43-aux|)))
(pop) ; 3
(push) ; 3
; [else-branch: 9 | this@2@00 == end@3@00]
(assert (= this@2@00 end@3@00))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=>
  (not (= this@2@00 end@3@00))
  (and
    (not (= this@2@00 end@3@00))
    (forall ((i@9@00 Int) (j@10@00 Int)) (!
      (and
        (=>
          (<= 0 i@9@00)
          (and (<= 0 i@9@00) (or (< i@9@00 j@10@00) (not (< i@9@00 j@10@00)))))
        (or (<= 0 i@9@00) (not (<= 0 i@9@00)))
        (=>
          (and
            (<= 0 i@9@00)
            (and (< i@9@00 j@10@00) (< j@10@00 (Seq_length result@4@00))))
          (and
            (<= 0 i@9@00)
            (< i@9@00 j@10@00)
            (< j@10@00 (Seq_length result@4@00))
            (prio%precondition $Snap.unit (Seq_index result@4@00 i@9@00))
            (prio%precondition $Snap.unit (Seq_index result@4@00 j@10@00))))
        (or
          (not
            (and
              (<= 0 i@9@00)
              (and (< i@9@00 j@10@00) (< j@10@00 (Seq_length result@4@00)))))
          (and
            (<= 0 i@9@00)
            (and (< i@9@00 j@10@00) (< j@10@00 (Seq_length result@4@00))))))
      :pattern ((Seq_index result@4@00 i@9@00) (prio%limited $Snap.unit (Seq_index
        result@4@00
        j@10@00)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0076.vpr@27@5@29@43-aux|))
    (forall ((i@9@00 Int) (j@10@00 Int)) (!
      (and
        (=>
          (<= 0 i@9@00)
          (and (<= 0 i@9@00) (or (< i@9@00 j@10@00) (not (< i@9@00 j@10@00)))))
        (or (<= 0 i@9@00) (not (<= 0 i@9@00)))
        (=>
          (and
            (<= 0 i@9@00)
            (and (< i@9@00 j@10@00) (< j@10@00 (Seq_length result@4@00))))
          (and
            (<= 0 i@9@00)
            (< i@9@00 j@10@00)
            (< j@10@00 (Seq_length result@4@00))
            (prio%precondition $Snap.unit (Seq_index result@4@00 i@9@00))
            (prio%precondition $Snap.unit (Seq_index result@4@00 j@10@00))))
        (or
          (not
            (and
              (<= 0 i@9@00)
              (and (< i@9@00 j@10@00) (< j@10@00 (Seq_length result@4@00)))))
          (and
            (<= 0 i@9@00)
            (and (< i@9@00 j@10@00) (< j@10@00 (Seq_length result@4@00))))))
      :pattern ((prio%limited $Snap.unit (Seq_index result@4@00 i@9@00)) (Seq_index
        result@4@00
        j@10@00))
      :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0076.vpr@27@5@29@43-aux|))
    (forall ((i@9@00 Int) (j@10@00 Int)) (!
      (and
        (=>
          (<= 0 i@9@00)
          (and (<= 0 i@9@00) (or (< i@9@00 j@10@00) (not (< i@9@00 j@10@00)))))
        (or (<= 0 i@9@00) (not (<= 0 i@9@00)))
        (=>
          (and
            (<= 0 i@9@00)
            (and (< i@9@00 j@10@00) (< j@10@00 (Seq_length result@4@00))))
          (and
            (<= 0 i@9@00)
            (< i@9@00 j@10@00)
            (< j@10@00 (Seq_length result@4@00))
            (prio%precondition $Snap.unit (Seq_index result@4@00 i@9@00))
            (prio%precondition $Snap.unit (Seq_index result@4@00 j@10@00))))
        (or
          (not
            (and
              (<= 0 i@9@00)
              (and (< i@9@00 j@10@00) (< j@10@00 (Seq_length result@4@00)))))
          (and
            (<= 0 i@9@00)
            (and (< i@9@00 j@10@00) (< j@10@00 (Seq_length result@4@00))))))
      :pattern ((prio%limited $Snap.unit (Seq_index result@4@00 i@9@00)) (prio%limited $Snap.unit (Seq_index
        result@4@00
        j@10@00)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0076.vpr@27@5@29@43-aux|)))))
; Joined path conditions
(assert (=>
  (not (= this@2@00 end@3@00))
  (forall ((i@9@00 Int) (j@10@00 Int)) (!
    (=>
      (and
        (<= 0 i@9@00)
        (and (< i@9@00 j@10@00) (< j@10@00 (Seq_length result@4@00))))
      (<=
        (prio $Snap.unit (Seq_index result@4@00 i@9@00))
        (prio $Snap.unit (Seq_index result@4@00 j@10@00))))
    :pattern ((Seq_index result@4@00 i@9@00) (prio%limited $Snap.unit (Seq_index
      result@4@00
      j@10@00)))
    :pattern ((prio%limited $Snap.unit (Seq_index result@4@00 i@9@00)) (Seq_index
      result@4@00
      j@10@00))
    :pattern ((prio%limited $Snap.unit (Seq_index result@4@00 i@9@00)) (prio%limited $Snap.unit (Seq_index
      result@4@00
      j@10@00)))
    :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0076.vpr@27@5@29@43|))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@2@00 $Ref) (end@3@00 $Ref)) (!
  (=
    (contentNodes%limited s@$ this@2@00 end@3@00)
    (contentNodes s@$ this@2@00 end@3@00))
  :pattern ((contentNodes s@$ this@2@00 end@3@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref) (end@3@00 $Ref)) (!
  (contentNodes%stateless this@2@00 end@3@00)
  :pattern ((contentNodes%limited s@$ this@2@00 end@3@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref) (end@3@00 $Ref)) (!
  (let ((result@4@00 (contentNodes%limited s@$ this@2@00 end@3@00))) (=>
    (contentNodes%precondition s@$ this@2@00 end@3@00)
    (and
      (=
        (= this@2@00 end@3@00)
        (Seq_equal result@4@00 (as Seq_empty  Seq<$Ref>)))
      (=> (not (= this@2@00 end@3@00)) (< 0 (Seq_length result@4@00)))
      (=>
        (not (= this@2@00 end@3@00))
        (=
          (Seq_index result@4@00 0)
          ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))
      (=>
        (not (= this@2@00 end@3@00))
        (forall ((i Int) (j Int)) (!
          (=>
            (and (<= 0 i) (and (< i j) (< j (Seq_length result@4@00))))
            (<=
              (prio $Snap.unit (Seq_index result@4@00 i))
              (prio $Snap.unit (Seq_index result@4@00 j))))
          :pattern ((Seq_index result@4@00 i) (prio%limited $Snap.unit (Seq_index
            result@4@00
            j)))
          :pattern ((prio%limited $Snap.unit (Seq_index result@4@00 i)) (Seq_index
            result@4@00
            j))
          :pattern ((prio%limited $Snap.unit (Seq_index result@4@00 i)) (prio%limited $Snap.unit (Seq_index
            result@4@00
            j)))
          ))))))
  :pattern ((contentNodes%limited s@$ this@2@00 end@3@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref) (end@3@00 $Ref)) (!
  (let ((result@4@00 (contentNodes%limited s@$ this@2@00 end@3@00))) true)
  :pattern ((contentNodes%limited s@$ this@2@00 end@3@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref) (end@3@00 $Ref)) (!
  (let ((result@4@00 (contentNodes%limited s@$ this@2@00 end@3@00))) true)
  :pattern ((contentNodes%limited s@$ this@2@00 end@3@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref) (end@3@00 $Ref)) (!
  (let ((result@4@00 (contentNodes%limited s@$ this@2@00 end@3@00))) true)
  :pattern ((contentNodes%limited s@$ this@2@00 end@3@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref) (end@3@00 $Ref)) (!
  (let ((result@4@00 (contentNodes%limited s@$ this@2@00 end@3@00))) (=>
    (and
      (contentNodes%precondition s@$ this@2@00 end@3@00)
      (not (= this@2@00 end@3@00)))
    (forall ((i Int) (j Int)) (!
      (=>
        (and (<= 0 i) (and (< i j) (< j (Seq_length result@4@00))))
        (and
          (prio%precondition $Snap.unit (Seq_index result@4@00 i))
          (prio%precondition $Snap.unit (Seq_index result@4@00 j))))
      :pattern ((Seq_index result@4@00 i) (prio%limited $Snap.unit (Seq_index
        result@4@00
        j)))
      :pattern ((prio%limited $Snap.unit (Seq_index result@4@00 i)) (Seq_index
        result@4@00
        j))
      :pattern ((prio%limited $Snap.unit (Seq_index result@4@00 i)) (prio%limited $Snap.unit (Seq_index
        result@4@00
        j)))
      ))))
  :pattern ((contentNodes%limited s@$ this@2@00 end@3@00))
  :qid |quant-u-8|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (this == end ? Seq[Ref]() : (unfolding acc(Lseg(this, end), write) in Seq(this.data) ++ (this.next == null ? Seq[Ref]() : contentNodes(this.next, end))))
; [eval] this == end
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= this@2@00 end@3@00))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= this@2@00 end@3@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | this@2@00 == end@3@00 | live]
; [else-branch: 13 | this@2@00 != end@3@00 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 13 | this@2@00 == end@3@00]
(assert (= this@2@00 end@3@00))
; [eval] Seq[Ref]()
(pop) ; 3
(push) ; 3
; [else-branch: 13 | this@2@00 != end@3@00]
(assert (not (= this@2@00 end@3@00)))
; [eval] (unfolding acc(Lseg(this, end), write) in Seq(this.data) ++ (this.next == null ? Seq[Ref]() : contentNodes(this.next, end)))
(push) ; 4
(assert (Lseg%trigger s@$ this@2@00 end@3@00))
; [eval] this != end
(push) ; 5
(set-option :timeout 10)
(assert (not (= this@2@00 end@3@00)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 14 | this@2@00 != end@3@00 | live]
; [else-branch: 14 | this@2@00 == end@3@00 | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 14 | this@2@00 != end@3@00]
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= this@2@00 $Ref.null)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
; [eval] this.next != null
(push) ; 6
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | First:(Second:(s@$)) != Null | live]
; [else-branch: 15 | First:(Second:(s@$)) == Null | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 15 | First:(Second:(s@$)) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] (unfolding acc(Lseg(this.next, end), write) in this.next != end ==> prio(this.data) <= prio(this.next.data))
(push) ; 7
(assert (Lseg%trigger ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))
; [eval] this != end
(push) ; 8
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 16 | First:(Second:(s@$)) != end@3@00 | live]
; [else-branch: 16 | First:(Second:(s@$)) == end@3@00 | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 16 | First:(Second:(s@$)) != end@3@00]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))))
(push) ; 9
(set-option :timeout 10)
(assert (not (= this@2@00 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))))
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= this@2@00 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 17 | First:(Second:(First:(Second:(Second:(s@$))))) != Null | live]
; [else-branch: 17 | First:(Second:(First:(Second:(Second:(s@$))))) == Null | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 17 | First:(Second:(First:(Second:(Second:(s@$))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
  $Snap.unit))
; [eval] (unfolding acc(Lseg(this.next, end), write) in this.next != end ==> prio(this.data) <= prio(this.next.data))
(declare-fun recunf@11@00 ($Snap $Ref $Ref) Bool)
(assert (recunf@11@00 s@$ this@2@00 end@3@00))
; [eval] this.next != end ==> prio(this.data) <= prio(this.next.data)
; [eval] this.next != end
(push) ; 10
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 18 | First:(Second:(s@$)) != end@3@00 | live]
; [else-branch: 18 | First:(Second:(s@$)) == end@3@00 | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 18 | First:(Second:(s@$)) != end@3@00]
; [eval] prio(this.data) <= prio(this.next.data)
; [eval] prio(this.data)
(push) ; 12
(assert (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))
(pop) ; 12
; Joined path conditions
(assert (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))
; [eval] prio(this.next.data)
(push) ; 12
(assert (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))
(pop) ; 12
; Joined path conditions
(assert (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))
  (and
    (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
    (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
(pop) ; 9
(push) ; 9
; [else-branch: 17 | First:(Second:(First:(Second:(Second:(s@$))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
  $Snap.unit))
; [eval] this.next != end ==> prio(this.data) <= prio(this.next.data)
; [eval] this.next != end
(push) ; 10
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 19 | First:(Second:(s@$)) != end@3@00 | live]
; [else-branch: 19 | First:(Second:(s@$)) == end@3@00 | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 19 | First:(Second:(s@$)) != end@3@00]
; [eval] prio(this.data) <= prio(this.next.data)
; [eval] prio(this.data)
(push) ; 12
(assert (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))
(pop) ; 12
; Joined path conditions
(assert (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))
; [eval] prio(this.next.data)
(push) ; 12
(assert (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))
(pop) ; 12
; Joined path conditions
(assert (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))
  (and
    (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
    (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
(pop) ; 9
(pop) ; 8
(push) ; 8
; [else-branch: 16 | First:(Second:(s@$)) == end@3@00]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] this.next != end ==> prio(this.data) <= prio(this.next.data)
; [eval] this.next != end
(push) ; 9
; [then-branch: 20 | First:(Second:(s@$)) != end@3@00 | dead]
; [else-branch: 20 | First:(Second:(s@$)) == end@3@00 | live]
(push) ; 10
; [else-branch: 20 | First:(Second:(s@$)) == end@3@00]
(pop) ; 10
(pop) ; 9
; Joined path conditions
(pop) ; 8
(pop) ; 7
(declare-fun joined_unfolding@12@00 ($Snap $Ref $Ref) Bool)
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
        $Ref.null))
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)))
  (=
    (joined_unfolding@12@00 s@$ this@2@00 end@3@00)
    (=>
      (not
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))
      (<=
        (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
        (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
      $Ref.null)
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)))
  (=
    (joined_unfolding@12@00 s@$ this@2@00 end@3@00)
    (=>
      (not
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))
      (<=
        (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
        (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)
  (= (joined_unfolding@12@00 s@$ this@2@00 end@3@00) true)))
; Joined path conditions
(assert (Lseg%trigger ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))
  (and
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))
    (=
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.combine
        ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))
        ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
    (=
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
        ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))))))
(assert (=>
  (and
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
      $Snap.unit)
    (recunf@11@00 s@$ this@2@00 end@3@00)
    (=>
      (not
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))
      (and
        (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
        (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))))))
; Joined path conditions
(assert (=>
  (and
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
      $Snap.unit)
    (=>
      (not
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))
      (and
        (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
        (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))))))
; Joined path conditions
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)
  (and
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)
    (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))))
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
      $Ref.null)
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
        $Ref.null))
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)))))
(assert (joined_unfolding@12@00 s@$ this@2@00 end@3@00))
; [eval] Seq(this.data) ++ (this.next == null ? Seq[Ref]() : contentNodes(this.next, end))
; [eval] Seq(this.data)
(assert (= (Seq_length (Seq_singleton ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))) 1))
; [eval] (this.next == null ? Seq[Ref]() : contentNodes(this.next, end))
; [eval] this.next == null
(push) ; 7
; [then-branch: 21 | First:(Second:(s@$)) == Null | dead]
; [else-branch: 21 | First:(Second:(s@$)) != Null | live]
(push) ; 8
; [else-branch: 21 | First:(Second:(s@$)) != Null]
; [eval] contentNodes(this.next, end)
(push) ; 9
(assert (contentNodes%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))
(pop) ; 9
; Joined path conditions
(assert (contentNodes%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
  (contentNodes%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)))
(pop) ; 6
(push) ; 6
; [else-branch: 15 | First:(Second:(s@$)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
(assert (= ($Snap.second ($Snap.second s@$)) $Snap.unit))
; [eval] Seq(this.data) ++ (this.next == null ? Seq[Ref]() : contentNodes(this.next, end))
; [eval] Seq(this.data)
(assert (= (Seq_length (Seq_singleton ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))) 1))
; [eval] (this.next == null ? Seq[Ref]() : contentNodes(this.next, end))
; [eval] this.next == null
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 22 | First:(Second:(s@$)) == Null | live]
; [else-branch: 22 | First:(Second:(s@$)) != Null | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 22 | First:(Second:(s@$)) == Null]
; [eval] Seq[Ref]()
(pop) ; 8
(pop) ; 7
; Joined path conditions
(pop) ; 6
(pop) ; 5
(pop) ; 4
(declare-fun joined_unfolding@13@00 ($Snap $Ref $Ref) Seq<$Ref>)
(assert (=>
  (and
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
    (not (= this@2@00 end@3@00)))
  (=
    (joined_unfolding@13@00 s@$ this@2@00 end@3@00)
    (Seq_append
      (Seq_singleton ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
      (contentNodes ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)))))
(assert (=>
  (and
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
    (not (= this@2@00 end@3@00)))
  (=
    (joined_unfolding@13@00 s@$ this@2@00 end@3@00)
    (Seq_append
      (Seq_singleton ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
      (as Seq_empty  Seq<$Ref>)))))
; Joined path conditions
(assert (Lseg%trigger s@$ this@2@00 end@3@00))
(assert (=>
  (not (= this@2@00 end@3@00))
  (and
    (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
    (not (= this@2@00 $Ref.null))
    (=
      ($Snap.second s@$)
      ($Snap.combine
        ($Snap.first ($Snap.second s@$))
        ($Snap.second ($Snap.second s@$)))))))
(assert (=>
  (and
    (not (= this@2@00 end@3@00))
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)))
  (and
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
    (=
      ($Snap.second ($Snap.second s@$))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second s@$)))
        ($Snap.second ($Snap.second ($Snap.second s@$)))))
    (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit)
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            end@3@00)))
      (=
        (joined_unfolding@12@00 s@$ this@2@00 end@3@00)
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              end@3@00))
          (<=
            (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
            (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            end@3@00)))
      (=
        (joined_unfolding@12@00 s@$ this@2@00 end@3@00)
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              end@3@00))
          (<=
            (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
            (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))))))))
    (=>
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)
      (= (joined_unfolding@12@00 s@$ this@2@00 end@3@00) true))
    (Lseg%trigger ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)
    (=>
      (not
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            end@3@00))
        (=
          ($Snap.first ($Snap.second ($Snap.second s@$)))
          ($Snap.combine
            ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))
            ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
        (=
          ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
            ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            end@3@00))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
            $Ref.null)))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
            $Ref.null))
        (=
          ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
          $Snap.unit)
        (recunf@11@00 s@$ this@2@00 end@3@00)
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              end@3@00))
          (and
            (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
            (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            end@3@00))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
          $Snap.unit)
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              end@3@00))
          (and
            (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
            (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))))))))
    (=>
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)
      (and
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)
        (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit)))
    (or
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            end@3@00)))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            end@3@00))))
    (joined_unfolding@12@00 s@$ this@2@00 end@3@00)
    (=
      (Seq_length (Seq_singleton ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))
      1)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          $Ref.null))
      (contentNodes%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)))))
; Joined path conditions
(assert (=>
  (and
    (not (= this@2@00 end@3@00))
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
  (and
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
    (= ($Snap.second ($Snap.second s@$)) $Snap.unit)
    (=
      (Seq_length (Seq_singleton ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))
      1))))
(assert (or
  (and
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
    (not (= this@2@00 end@3@00)))
  (and
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
    (not (= this@2@00 end@3@00)))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= this@2@00 end@3@00))
  (and
    (not (= this@2@00 end@3@00))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            $Ref.null))
        (not (= this@2@00 end@3@00)))
      (=
        (joined_unfolding@13@00 s@$ this@2@00 end@3@00)
        (Seq_append
          (Seq_singleton ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
          (contentNodes ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          $Ref.null)
        (not (= this@2@00 end@3@00)))
      (=
        (joined_unfolding@13@00 s@$ this@2@00 end@3@00)
        (Seq_append
          (Seq_singleton ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
          (as Seq_empty  Seq<$Ref>))))
    (Lseg%trigger s@$ this@2@00 end@3@00)
    (=>
      (not (= this@2@00 end@3@00))
      (and
        (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
        (not (= this@2@00 $Ref.null))
        (=
          ($Snap.second s@$)
          ($Snap.combine
            ($Snap.first ($Snap.second s@$))
            ($Snap.second ($Snap.second s@$))))))
    (=>
      (and
        (not (= this@2@00 end@3@00))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            $Ref.null)))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            $Ref.null))
        (=
          ($Snap.second ($Snap.second s@$))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second s@$)))
            ($Snap.second ($Snap.second ($Snap.second s@$)))))
        (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit)
        (=>
          (and
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
                $Ref.null))
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                end@3@00)))
          (=
            (joined_unfolding@12@00 s@$ this@2@00 end@3@00)
            (=>
              (not
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                  end@3@00))
              (<=
                (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
                (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))))))))
        (=>
          (and
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
              $Ref.null)
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                end@3@00)))
          (=
            (joined_unfolding@12@00 s@$ this@2@00 end@3@00)
            (=>
              (not
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                  end@3@00))
              (<=
                (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
                (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))))))))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            end@3@00)
          (= (joined_unfolding@12@00 s@$ this@2@00 end@3@00) true))
        (Lseg%trigger ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              end@3@00))
          (and
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                end@3@00))
            (=
              ($Snap.first ($Snap.second ($Snap.second s@$)))
              ($Snap.combine
                ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))
                ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
            (=
              ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
                ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
        (=>
          (and
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                end@3@00))
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
                $Ref.null)))
          (and
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
                $Ref.null))
            (=
              ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
                ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))))
            (=
              ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
              $Snap.unit)
            (recunf@11@00 s@$ this@2@00 end@3@00)
            (=>
              (not
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                  end@3@00))
              (and
                (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
                (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))))))))
        (=>
          (and
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                end@3@00))
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
              $Ref.null))
          (and
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
              $Ref.null)
            (=
              ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
              $Snap.unit)
            (=>
              (not
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                  end@3@00))
              (and
                (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
                (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))))))))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            end@3@00)
          (and
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              end@3@00)
            (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit)))
        (or
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            end@3@00)
          (and
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
              $Ref.null)
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                end@3@00)))
          (and
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
                $Ref.null))
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                end@3@00))))
        (joined_unfolding@12@00 s@$ this@2@00 end@3@00)
        (=
          (Seq_length
            (Seq_singleton ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))
          1)
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              $Ref.null))
          (contentNodes%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))))
    (=>
      (and
        (not (= this@2@00 end@3@00))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          $Ref.null)
        (= ($Snap.second ($Snap.second s@$)) $Snap.unit)
        (=
          (Seq_length
            (Seq_singleton ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))
          1)))
    (or
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          $Ref.null)
        (not (= this@2@00 end@3@00)))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            $Ref.null))
        (not (= this@2@00 end@3@00)))))))
(assert (or (not (= this@2@00 end@3@00)) (= this@2@00 end@3@00)))
(assert (=
  result@4@00
  (ite
    (= this@2@00 end@3@00)
    (as Seq_empty  Seq<$Ref>)
    (joined_unfolding@13@00 s@$ this@2@00 end@3@00))))
; [eval] (this == end) == (result == Seq[Ref]())
; [eval] this == end
; [eval] result == Seq[Ref]()
; [eval] Seq[Ref]()
(push) ; 2
(assert (not (= (= this@2@00 end@3@00) (Seq_equal result@4@00 (as Seq_empty  Seq<$Ref>)))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (= (= this@2@00 end@3@00) (Seq_equal result@4@00 (as Seq_empty  Seq<$Ref>))))
; [eval] this != end ==> 0 < |result|
; [eval] this != end
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (= this@2@00 end@3@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= this@2@00 end@3@00))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 23 | this@2@00 != end@3@00 | live]
; [else-branch: 23 | this@2@00 == end@3@00 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 23 | this@2@00 != end@3@00]
(assert (not (= this@2@00 end@3@00)))
; [eval] 0 < |result|
; [eval] |result|
(pop) ; 3
(push) ; 3
; [else-branch: 23 | this@2@00 == end@3@00]
(assert (= this@2@00 end@3@00))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (= this@2@00 end@3@00) (not (= this@2@00 end@3@00))))
(push) ; 2
(assert (not (=> (not (= this@2@00 end@3@00)) (< 0 (Seq_length result@4@00)))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=> (not (= this@2@00 end@3@00)) (< 0 (Seq_length result@4@00))))
; [eval] this != end ==> result[0] == (unfolding acc(Lseg(this, end), write) in this.data)
; [eval] this != end
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (= this@2@00 end@3@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= this@2@00 end@3@00))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 24 | this@2@00 != end@3@00 | live]
; [else-branch: 24 | this@2@00 == end@3@00 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 24 | this@2@00 != end@3@00]
(assert (not (= this@2@00 end@3@00)))
; [eval] result[0] == (unfolding acc(Lseg(this, end), write) in this.data)
; [eval] result[0]
(push) ; 4
(assert (not (< 0 (Seq_length result@4@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] (unfolding acc(Lseg(this, end), write) in this.data)
(push) ; 4
(assert (Lseg%trigger s@$ this@2@00 end@3@00))
; [eval] this != end
(push) ; 5
(set-option :timeout 10)
(assert (not (= this@2@00 end@3@00)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 25 | this@2@00 != end@3@00 | live]
; [else-branch: 25 | this@2@00 == end@3@00 | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 25 | this@2@00 != end@3@00]
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= this@2@00 $Ref.null)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
; [eval] this.next != null
(push) ; 6
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 26 | First:(Second:(s@$)) != Null | live]
; [else-branch: 26 | First:(Second:(s@$)) == Null | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 26 | First:(Second:(s@$)) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] (unfolding acc(Lseg(this.next, end), write) in this.next != end ==> prio(this.data) <= prio(this.next.data))
(push) ; 7
(assert (Lseg%trigger ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))
; [eval] this != end
(push) ; 8
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 27 | First:(Second:(s@$)) != end@3@00 | live]
; [else-branch: 27 | First:(Second:(s@$)) == end@3@00 | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 27 | First:(Second:(s@$)) != end@3@00]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))))
(push) ; 9
(set-option :timeout 10)
(assert (not (= this@2@00 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))))
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= this@2@00 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 28 | First:(Second:(First:(Second:(Second:(s@$))))) != Null | live]
; [else-branch: 28 | First:(Second:(First:(Second:(Second:(s@$))))) == Null | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 28 | First:(Second:(First:(Second:(Second:(s@$))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
  $Snap.unit))
; [eval] (unfolding acc(Lseg(this.next, end), write) in this.next != end ==> prio(this.data) <= prio(this.next.data))
(declare-fun recunf@14@00 ($Snap $Ref $Ref) Bool)
(assert (recunf@14@00 s@$ this@2@00 end@3@00))
; [eval] this.next != end ==> prio(this.data) <= prio(this.next.data)
; [eval] this.next != end
(push) ; 10
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 29 | First:(Second:(s@$)) != end@3@00 | live]
; [else-branch: 29 | First:(Second:(s@$)) == end@3@00 | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 29 | First:(Second:(s@$)) != end@3@00]
; [eval] prio(this.data) <= prio(this.next.data)
; [eval] prio(this.data)
(push) ; 12
(assert (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))
(pop) ; 12
; Joined path conditions
(assert (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))
; [eval] prio(this.next.data)
(push) ; 12
(assert (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))
(pop) ; 12
; Joined path conditions
(assert (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))
  (and
    (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
    (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
(pop) ; 9
(push) ; 9
; [else-branch: 28 | First:(Second:(First:(Second:(Second:(s@$))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
  $Snap.unit))
; [eval] this.next != end ==> prio(this.data) <= prio(this.next.data)
; [eval] this.next != end
(push) ; 10
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 30 | First:(Second:(s@$)) != end@3@00 | live]
; [else-branch: 30 | First:(Second:(s@$)) == end@3@00 | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 30 | First:(Second:(s@$)) != end@3@00]
; [eval] prio(this.data) <= prio(this.next.data)
; [eval] prio(this.data)
(push) ; 12
(assert (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))
(pop) ; 12
; Joined path conditions
(assert (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))
; [eval] prio(this.next.data)
(push) ; 12
(assert (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))
(pop) ; 12
; Joined path conditions
(assert (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))
  (and
    (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
    (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
(pop) ; 9
(pop) ; 8
(push) ; 8
; [else-branch: 27 | First:(Second:(s@$)) == end@3@00]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] this.next != end ==> prio(this.data) <= prio(this.next.data)
; [eval] this.next != end
(push) ; 9
; [then-branch: 31 | First:(Second:(s@$)) != end@3@00 | dead]
; [else-branch: 31 | First:(Second:(s@$)) == end@3@00 | live]
(push) ; 10
; [else-branch: 31 | First:(Second:(s@$)) == end@3@00]
(pop) ; 10
(pop) ; 9
; Joined path conditions
(pop) ; 8
(pop) ; 7
(declare-fun joined_unfolding@15@00 ($Snap $Ref $Ref) Bool)
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
        $Ref.null))
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)))
  (=
    (joined_unfolding@15@00 s@$ this@2@00 end@3@00)
    (=>
      (not
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))
      (<=
        (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
        (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
      $Ref.null)
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)))
  (=
    (joined_unfolding@15@00 s@$ this@2@00 end@3@00)
    (=>
      (not
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))
      (<=
        (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
        (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)
  (= (joined_unfolding@15@00 s@$ this@2@00 end@3@00) true)))
; Joined path conditions
(assert (Lseg%trigger ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))
  (and
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))
    (=
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.combine
        ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))
        ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
    (=
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
        ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))))))
(assert (=>
  (and
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
      $Snap.unit)
    (recunf@14@00 s@$ this@2@00 end@3@00)
    (=>
      (not
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))
      (and
        (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
        (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))))))
; Joined path conditions
(assert (=>
  (and
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
      $Snap.unit)
    (=>
      (not
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))
      (and
        (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
        (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))))))
; Joined path conditions
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)
  (and
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)
    (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))))
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
      $Ref.null)
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
        $Ref.null))
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)))))
(assert (joined_unfolding@15@00 s@$ this@2@00 end@3@00))
(pop) ; 6
(push) ; 6
; [else-branch: 26 | First:(Second:(s@$)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
(assert (= ($Snap.second ($Snap.second s@$)) $Snap.unit))
(pop) ; 6
(pop) ; 5
(pop) ; 4
(declare-fun joined_unfolding@16@00 ($Snap $Ref $Ref) $Ref)
(assert (=>
  (and
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
    (not (= this@2@00 end@3@00)))
  (=
    (joined_unfolding@16@00 s@$ this@2@00 end@3@00)
    ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))))
(assert (=>
  (and
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
    (not (= this@2@00 end@3@00)))
  (=
    (joined_unfolding@16@00 s@$ this@2@00 end@3@00)
    ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))))
; Joined path conditions
(assert (Lseg%trigger s@$ this@2@00 end@3@00))
(assert (=>
  (not (= this@2@00 end@3@00))
  (and
    (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
    (not (= this@2@00 $Ref.null))
    (=
      ($Snap.second s@$)
      ($Snap.combine
        ($Snap.first ($Snap.second s@$))
        ($Snap.second ($Snap.second s@$)))))))
(assert (=>
  (and
    (not (= this@2@00 end@3@00))
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)))
  (and
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
    (=
      ($Snap.second ($Snap.second s@$))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second s@$)))
        ($Snap.second ($Snap.second ($Snap.second s@$)))))
    (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit)
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            end@3@00)))
      (=
        (joined_unfolding@15@00 s@$ this@2@00 end@3@00)
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              end@3@00))
          (<=
            (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
            (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            end@3@00)))
      (=
        (joined_unfolding@15@00 s@$ this@2@00 end@3@00)
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              end@3@00))
          (<=
            (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
            (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))))))))
    (=>
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)
      (= (joined_unfolding@15@00 s@$ this@2@00 end@3@00) true))
    (Lseg%trigger ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)
    (=>
      (not
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            end@3@00))
        (=
          ($Snap.first ($Snap.second ($Snap.second s@$)))
          ($Snap.combine
            ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))
            ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
        (=
          ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
            ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            end@3@00))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
            $Ref.null)))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
            $Ref.null))
        (=
          ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
          $Snap.unit)
        (recunf@14@00 s@$ this@2@00 end@3@00)
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              end@3@00))
          (and
            (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
            (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            end@3@00))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
          $Snap.unit)
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              end@3@00))
          (and
            (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
            (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))))))))
    (=>
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)
      (and
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)
        (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit)))
    (or
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            end@3@00)))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            end@3@00))))
    (joined_unfolding@15@00 s@$ this@2@00 end@3@00))))
; Joined path conditions
(assert (=>
  (and
    (not (= this@2@00 end@3@00))
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
  (and
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
    (= ($Snap.second ($Snap.second s@$)) $Snap.unit))))
(assert (or
  (and
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
    (not (= this@2@00 end@3@00)))
  (and
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
    (not (= this@2@00 end@3@00)))))
(pop) ; 3
(push) ; 3
; [else-branch: 24 | this@2@00 == end@3@00]
(assert (= this@2@00 end@3@00))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=>
  (not (= this@2@00 end@3@00))
  (and
    (not (= this@2@00 end@3@00))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            $Ref.null))
        (not (= this@2@00 end@3@00)))
      (=
        (joined_unfolding@16@00 s@$ this@2@00 end@3@00)
        ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          $Ref.null)
        (not (= this@2@00 end@3@00)))
      (=
        (joined_unfolding@16@00 s@$ this@2@00 end@3@00)
        ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))
    (Lseg%trigger s@$ this@2@00 end@3@00)
    (=>
      (not (= this@2@00 end@3@00))
      (and
        (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
        (not (= this@2@00 $Ref.null))
        (=
          ($Snap.second s@$)
          ($Snap.combine
            ($Snap.first ($Snap.second s@$))
            ($Snap.second ($Snap.second s@$))))))
    (=>
      (and
        (not (= this@2@00 end@3@00))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            $Ref.null)))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            $Ref.null))
        (=
          ($Snap.second ($Snap.second s@$))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second s@$)))
            ($Snap.second ($Snap.second ($Snap.second s@$)))))
        (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit)
        (=>
          (and
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
                $Ref.null))
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                end@3@00)))
          (=
            (joined_unfolding@15@00 s@$ this@2@00 end@3@00)
            (=>
              (not
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                  end@3@00))
              (<=
                (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
                (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))))))))
        (=>
          (and
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
              $Ref.null)
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                end@3@00)))
          (=
            (joined_unfolding@15@00 s@$ this@2@00 end@3@00)
            (=>
              (not
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                  end@3@00))
              (<=
                (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
                (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))))))))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            end@3@00)
          (= (joined_unfolding@15@00 s@$ this@2@00 end@3@00) true))
        (Lseg%trigger ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00)
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              end@3@00))
          (and
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                end@3@00))
            (=
              ($Snap.first ($Snap.second ($Snap.second s@$)))
              ($Snap.combine
                ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))
                ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
            (=
              ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
                ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
        (=>
          (and
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                end@3@00))
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
                $Ref.null)))
          (and
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
                $Ref.null))
            (=
              ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
                ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))))
            (=
              ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
              $Snap.unit)
            (recunf@14@00 s@$ this@2@00 end@3@00)
            (=>
              (not
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                  end@3@00))
              (and
                (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
                (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))))))))
        (=>
          (and
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                end@3@00))
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
              $Ref.null))
          (and
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
              $Ref.null)
            (=
              ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
              $Snap.unit)
            (=>
              (not
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                  end@3@00))
              (and
                (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
                (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))))))))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            end@3@00)
          (and
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              end@3@00)
            (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit)))
        (or
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            end@3@00)
          (and
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
              $Ref.null)
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                end@3@00)))
          (and
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
                $Ref.null))
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                end@3@00))))
        (joined_unfolding@15@00 s@$ this@2@00 end@3@00)))
    (=>
      (and
        (not (= this@2@00 end@3@00))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          $Ref.null)
        (= ($Snap.second ($Snap.second s@$)) $Snap.unit)))
    (or
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          $Ref.null)
        (not (= this@2@00 end@3@00)))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            $Ref.null))
        (not (= this@2@00 end@3@00)))))))
; Joined path conditions
(push) ; 2
(assert (not (=>
  (not (= this@2@00 end@3@00))
  (= (Seq_index result@4@00 0) (joined_unfolding@16@00 s@$ this@2@00 end@3@00)))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (not (= this@2@00 end@3@00))
  (= (Seq_index result@4@00 0) (joined_unfolding@16@00 s@$ this@2@00 end@3@00))))
; [eval] this != end ==> (forall i: Int, j: Int :: { result[i], prio(result[j]) } { prio(result[i]), result[j] } { prio(result[i]), prio(result[j]) } 0 <= i && (i < j && j < |result|) ==> prio(result[i]) <= prio(result[j]))
; [eval] this != end
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (= this@2@00 end@3@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= this@2@00 end@3@00))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 32 | this@2@00 != end@3@00 | live]
; [else-branch: 32 | this@2@00 == end@3@00 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 32 | this@2@00 != end@3@00]
(assert (not (= this@2@00 end@3@00)))
; [eval] (forall i: Int, j: Int :: { result[i], prio(result[j]) } { prio(result[i]), result[j] } { prio(result[i]), prio(result[j]) } 0 <= i && (i < j && j < |result|) ==> prio(result[i]) <= prio(result[j]))
(declare-const i@17@00 Int)
(declare-const j@18@00 Int)
(push) ; 4
; [eval] 0 <= i && (i < j && j < |result|) ==> prio(result[i]) <= prio(result[j])
; [eval] 0 <= i && (i < j && j < |result|)
; [eval] 0 <= i
(push) ; 5
; [then-branch: 33 | !(0 <= i@17@00) | live]
; [else-branch: 33 | 0 <= i@17@00 | live]
(push) ; 6
; [then-branch: 33 | !(0 <= i@17@00)]
(assert (not (<= 0 i@17@00)))
(pop) ; 6
(push) ; 6
; [else-branch: 33 | 0 <= i@17@00]
(assert (<= 0 i@17@00))
; [eval] i < j
(push) ; 7
; [then-branch: 34 | !(i@17@00 < j@18@00) | live]
; [else-branch: 34 | i@17@00 < j@18@00 | live]
(push) ; 8
; [then-branch: 34 | !(i@17@00 < j@18@00)]
(assert (not (< i@17@00 j@18@00)))
(pop) ; 8
(push) ; 8
; [else-branch: 34 | i@17@00 < j@18@00]
(assert (< i@17@00 j@18@00))
; [eval] j < |result|
; [eval] |result|
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (< i@17@00 j@18@00) (not (< i@17@00 j@18@00))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@17@00)
  (and (<= 0 i@17@00) (or (< i@17@00 j@18@00) (not (< i@17@00 j@18@00))))))
(assert (or (<= 0 i@17@00) (not (<= 0 i@17@00))))
(push) ; 5
; [then-branch: 35 | 0 <= i@17@00 && i@17@00 < j@18@00 && j@18@00 < |result@4@00| | live]
; [else-branch: 35 | !(0 <= i@17@00 && i@17@00 < j@18@00 && j@18@00 < |result@4@00|) | live]
(push) ; 6
; [then-branch: 35 | 0 <= i@17@00 && i@17@00 < j@18@00 && j@18@00 < |result@4@00|]
(assert (and
  (<= 0 i@17@00)
  (and (< i@17@00 j@18@00) (< j@18@00 (Seq_length result@4@00)))))
; [eval] prio(result[i]) <= prio(result[j])
; [eval] prio(result[i])
; [eval] result[i]
(push) ; 7
(assert (not (>= i@17@00 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@17@00 (Seq_length result@4@00))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (prio%precondition $Snap.unit (Seq_index result@4@00 i@17@00)))
(pop) ; 7
; Joined path conditions
(assert (prio%precondition $Snap.unit (Seq_index result@4@00 i@17@00)))
; [eval] prio(result[j])
; [eval] result[j]
(push) ; 7
(assert (not (>= j@18@00 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (prio%precondition $Snap.unit (Seq_index result@4@00 j@18@00)))
(pop) ; 7
; Joined path conditions
(assert (prio%precondition $Snap.unit (Seq_index result@4@00 j@18@00)))
(pop) ; 6
(push) ; 6
; [else-branch: 35 | !(0 <= i@17@00 && i@17@00 < j@18@00 && j@18@00 < |result@4@00|)]
(assert (not
  (and
    (<= 0 i@17@00)
    (and (< i@17@00 j@18@00) (< j@18@00 (Seq_length result@4@00))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@17@00)
    (and (< i@17@00 j@18@00) (< j@18@00 (Seq_length result@4@00))))
  (and
    (<= 0 i@17@00)
    (< i@17@00 j@18@00)
    (< j@18@00 (Seq_length result@4@00))
    (prio%precondition $Snap.unit (Seq_index result@4@00 i@17@00))
    (prio%precondition $Snap.unit (Seq_index result@4@00 j@18@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@17@00)
      (and (< i@17@00 j@18@00) (< j@18@00 (Seq_length result@4@00)))))
  (and
    (<= 0 i@17@00)
    (and (< i@17@00 j@18@00) (< j@18@00 (Seq_length result@4@00))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@17@00 Int) (j@18@00 Int)) (!
  (and
    (=>
      (<= 0 i@17@00)
      (and (<= 0 i@17@00) (or (< i@17@00 j@18@00) (not (< i@17@00 j@18@00)))))
    (or (<= 0 i@17@00) (not (<= 0 i@17@00)))
    (=>
      (and
        (<= 0 i@17@00)
        (and (< i@17@00 j@18@00) (< j@18@00 (Seq_length result@4@00))))
      (and
        (<= 0 i@17@00)
        (< i@17@00 j@18@00)
        (< j@18@00 (Seq_length result@4@00))
        (prio%precondition $Snap.unit (Seq_index result@4@00 i@17@00))
        (prio%precondition $Snap.unit (Seq_index result@4@00 j@18@00))))
    (or
      (not
        (and
          (<= 0 i@17@00)
          (and (< i@17@00 j@18@00) (< j@18@00 (Seq_length result@4@00)))))
      (and
        (<= 0 i@17@00)
        (and (< i@17@00 j@18@00) (< j@18@00 (Seq_length result@4@00))))))
  :pattern ((Seq_index result@4@00 i@17@00) (prio%limited $Snap.unit (Seq_index
    result@4@00
    j@18@00)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0076.vpr@27@5@29@43-aux|)))
(assert (forall ((i@17@00 Int) (j@18@00 Int)) (!
  (and
    (=>
      (<= 0 i@17@00)
      (and (<= 0 i@17@00) (or (< i@17@00 j@18@00) (not (< i@17@00 j@18@00)))))
    (or (<= 0 i@17@00) (not (<= 0 i@17@00)))
    (=>
      (and
        (<= 0 i@17@00)
        (and (< i@17@00 j@18@00) (< j@18@00 (Seq_length result@4@00))))
      (and
        (<= 0 i@17@00)
        (< i@17@00 j@18@00)
        (< j@18@00 (Seq_length result@4@00))
        (prio%precondition $Snap.unit (Seq_index result@4@00 i@17@00))
        (prio%precondition $Snap.unit (Seq_index result@4@00 j@18@00))))
    (or
      (not
        (and
          (<= 0 i@17@00)
          (and (< i@17@00 j@18@00) (< j@18@00 (Seq_length result@4@00)))))
      (and
        (<= 0 i@17@00)
        (and (< i@17@00 j@18@00) (< j@18@00 (Seq_length result@4@00))))))
  :pattern ((prio%limited $Snap.unit (Seq_index result@4@00 i@17@00)) (Seq_index
    result@4@00
    j@18@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0076.vpr@27@5@29@43-aux|)))
(assert (forall ((i@17@00 Int) (j@18@00 Int)) (!
  (and
    (=>
      (<= 0 i@17@00)
      (and (<= 0 i@17@00) (or (< i@17@00 j@18@00) (not (< i@17@00 j@18@00)))))
    (or (<= 0 i@17@00) (not (<= 0 i@17@00)))
    (=>
      (and
        (<= 0 i@17@00)
        (and (< i@17@00 j@18@00) (< j@18@00 (Seq_length result@4@00))))
      (and
        (<= 0 i@17@00)
        (< i@17@00 j@18@00)
        (< j@18@00 (Seq_length result@4@00))
        (prio%precondition $Snap.unit (Seq_index result@4@00 i@17@00))
        (prio%precondition $Snap.unit (Seq_index result@4@00 j@18@00))))
    (or
      (not
        (and
          (<= 0 i@17@00)
          (and (< i@17@00 j@18@00) (< j@18@00 (Seq_length result@4@00)))))
      (and
        (<= 0 i@17@00)
        (and (< i@17@00 j@18@00) (< j@18@00 (Seq_length result@4@00))))))
  :pattern ((prio%limited $Snap.unit (Seq_index result@4@00 i@17@00)) (prio%limited $Snap.unit (Seq_index
    result@4@00
    j@18@00)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0076.vpr@27@5@29@43-aux|)))
(pop) ; 3
(push) ; 3
; [else-branch: 32 | this@2@00 == end@3@00]
(assert (= this@2@00 end@3@00))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=>
  (not (= this@2@00 end@3@00))
  (and
    (not (= this@2@00 end@3@00))
    (forall ((i@17@00 Int) (j@18@00 Int)) (!
      (and
        (=>
          (<= 0 i@17@00)
          (and (<= 0 i@17@00) (or (< i@17@00 j@18@00) (not (< i@17@00 j@18@00)))))
        (or (<= 0 i@17@00) (not (<= 0 i@17@00)))
        (=>
          (and
            (<= 0 i@17@00)
            (and (< i@17@00 j@18@00) (< j@18@00 (Seq_length result@4@00))))
          (and
            (<= 0 i@17@00)
            (< i@17@00 j@18@00)
            (< j@18@00 (Seq_length result@4@00))
            (prio%precondition $Snap.unit (Seq_index result@4@00 i@17@00))
            (prio%precondition $Snap.unit (Seq_index result@4@00 j@18@00))))
        (or
          (not
            (and
              (<= 0 i@17@00)
              (and (< i@17@00 j@18@00) (< j@18@00 (Seq_length result@4@00)))))
          (and
            (<= 0 i@17@00)
            (and (< i@17@00 j@18@00) (< j@18@00 (Seq_length result@4@00))))))
      :pattern ((Seq_index result@4@00 i@17@00) (prio%limited $Snap.unit (Seq_index
        result@4@00
        j@18@00)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0076.vpr@27@5@29@43-aux|))
    (forall ((i@17@00 Int) (j@18@00 Int)) (!
      (and
        (=>
          (<= 0 i@17@00)
          (and (<= 0 i@17@00) (or (< i@17@00 j@18@00) (not (< i@17@00 j@18@00)))))
        (or (<= 0 i@17@00) (not (<= 0 i@17@00)))
        (=>
          (and
            (<= 0 i@17@00)
            (and (< i@17@00 j@18@00) (< j@18@00 (Seq_length result@4@00))))
          (and
            (<= 0 i@17@00)
            (< i@17@00 j@18@00)
            (< j@18@00 (Seq_length result@4@00))
            (prio%precondition $Snap.unit (Seq_index result@4@00 i@17@00))
            (prio%precondition $Snap.unit (Seq_index result@4@00 j@18@00))))
        (or
          (not
            (and
              (<= 0 i@17@00)
              (and (< i@17@00 j@18@00) (< j@18@00 (Seq_length result@4@00)))))
          (and
            (<= 0 i@17@00)
            (and (< i@17@00 j@18@00) (< j@18@00 (Seq_length result@4@00))))))
      :pattern ((prio%limited $Snap.unit (Seq_index result@4@00 i@17@00)) (Seq_index
        result@4@00
        j@18@00))
      :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0076.vpr@27@5@29@43-aux|))
    (forall ((i@17@00 Int) (j@18@00 Int)) (!
      (and
        (=>
          (<= 0 i@17@00)
          (and (<= 0 i@17@00) (or (< i@17@00 j@18@00) (not (< i@17@00 j@18@00)))))
        (or (<= 0 i@17@00) (not (<= 0 i@17@00)))
        (=>
          (and
            (<= 0 i@17@00)
            (and (< i@17@00 j@18@00) (< j@18@00 (Seq_length result@4@00))))
          (and
            (<= 0 i@17@00)
            (< i@17@00 j@18@00)
            (< j@18@00 (Seq_length result@4@00))
            (prio%precondition $Snap.unit (Seq_index result@4@00 i@17@00))
            (prio%precondition $Snap.unit (Seq_index result@4@00 j@18@00))))
        (or
          (not
            (and
              (<= 0 i@17@00)
              (and (< i@17@00 j@18@00) (< j@18@00 (Seq_length result@4@00)))))
          (and
            (<= 0 i@17@00)
            (and (< i@17@00 j@18@00) (< j@18@00 (Seq_length result@4@00))))))
      :pattern ((prio%limited $Snap.unit (Seq_index result@4@00 i@17@00)) (prio%limited $Snap.unit (Seq_index
        result@4@00
        j@18@00)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0076.vpr@27@5@29@43-aux|)))))
; Joined path conditions
(push) ; 2
(assert (not (=>
  (not (= this@2@00 end@3@00))
  (forall ((i@17@00 Int) (j@18@00 Int)) (!
    (=>
      (and
        (<= 0 i@17@00)
        (and (< i@17@00 j@18@00) (< j@18@00 (Seq_length result@4@00))))
      (<=
        (prio $Snap.unit (Seq_index result@4@00 i@17@00))
        (prio $Snap.unit (Seq_index result@4@00 j@18@00))))
    :pattern ((Seq_index result@4@00 i@17@00) (prio%limited $Snap.unit (Seq_index
      result@4@00
      j@18@00)))
    :pattern ((prio%limited $Snap.unit (Seq_index result@4@00 i@17@00)) (Seq_index
      result@4@00
      j@18@00))
    :pattern ((prio%limited $Snap.unit (Seq_index result@4@00 i@17@00)) (prio%limited $Snap.unit (Seq_index
      result@4@00
      j@18@00)))
    :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0076.vpr@27@5@29@43|)))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (not (= this@2@00 end@3@00))
  (forall ((i@17@00 Int) (j@18@00 Int)) (!
    (=>
      (and
        (<= 0 i@17@00)
        (and (< i@17@00 j@18@00) (< j@18@00 (Seq_length result@4@00))))
      (<=
        (prio $Snap.unit (Seq_index result@4@00 i@17@00))
        (prio $Snap.unit (Seq_index result@4@00 j@18@00))))
    :pattern ((Seq_index result@4@00 i@17@00) (prio%limited $Snap.unit (Seq_index
      result@4@00
      j@18@00)))
    :pattern ((prio%limited $Snap.unit (Seq_index result@4@00 i@17@00)) (Seq_index
      result@4@00
      j@18@00))
    :pattern ((prio%limited $Snap.unit (Seq_index result@4@00 i@17@00)) (prio%limited $Snap.unit (Seq_index
      result@4@00
      j@18@00)))
    :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0076.vpr@27@5@29@43|))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@2@00 $Ref) (end@3@00 $Ref)) (!
  (=>
    (contentNodes%precondition s@$ this@2@00 end@3@00)
    (=
      (contentNodes s@$ this@2@00 end@3@00)
      (ite
        (= this@2@00 end@3@00)
        (as Seq_empty  Seq<$Ref>)
        (Seq_append
          (Seq_singleton ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
          (ite
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              $Ref.null)
            (as Seq_empty  Seq<$Ref>)
            (contentNodes%limited ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))))))
  :pattern ((contentNodes s@$ this@2@00 end@3@00))
  :pattern ((contentNodes%stateless this@2@00 end@3@00) (Lseg%trigger s@$ this@2@00 end@3@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref) (end@3@00 $Ref)) (!
  (=>
    (contentNodes%precondition s@$ this@2@00 end@3@00)
    (ite
      (= this@2@00 end@3@00)
      true
      (ite
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          $Ref.null)
        true
        (contentNodes%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@3@00))))
  :pattern ((contentNodes s@$ this@2@00 end@3@00))
  :qid |quant-u-10|)))
; ---------- Lseg ----------
(declare-const this@19@00 $Ref)
(declare-const end@20@00 $Ref)
(push) ; 1
; [eval] this != end
(push) ; 2
(set-option :timeout 10)
(assert (not (= this@19@00 end@20@00)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (not (= this@19@00 end@20@00))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 36 | this@19@00 != end@20@00 | live]
; [else-branch: 36 | this@19@00 == end@20@00 | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 36 | this@19@00 != end@20@00]
(assert (not (= this@19@00 end@20@00)))
(declare-const $t@21@00 $Snap)
(assert (= $t@21@00 ($Snap.combine ($Snap.first $t@21@00) ($Snap.second $t@21@00))))
(assert (not (= this@19@00 $Ref.null)))
(assert (=
  ($Snap.second $t@21@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@21@00))
    ($Snap.second ($Snap.second $t@21@00)))))
; [eval] this.next != null
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@21@00))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@21@00))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 37 | First:(Second:($t@21@00)) != Null | live]
; [else-branch: 37 | First:(Second:($t@21@00)) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 37 | First:(Second:($t@21@00)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@21@00))) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second $t@21@00))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@21@00)))
    ($Snap.second ($Snap.second ($Snap.second $t@21@00))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@21@00))) $Snap.unit))
; [eval] (unfolding acc(Lseg(this.next, end), write) in this.next != end ==> prio(this.data) <= prio(this.next.data))
(push) ; 4
(assert (Lseg%trigger ($Snap.first ($Snap.second ($Snap.second $t@21@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@21@00))) end@20@00))
; [eval] this != end
(push) ; 5
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@21@00))) end@20@00)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@21@00))) end@20@00))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 38 | First:(Second:($t@21@00)) != end@20@00 | live]
; [else-branch: 38 | First:(Second:($t@21@00)) == end@20@00 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 38 | First:(Second:($t@21@00)) != end@20@00]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@21@00))) end@20@00)))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second $t@21@00)))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@00))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))
(push) ; 6
(set-option :timeout 10)
(assert (not (= this@19@00 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@21@00))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= this@19@00 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@21@00))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 39 | First:(Second:(First:(Second:(Second:($t@21@00))))) != Null | live]
; [else-branch: 39 | First:(Second:(First:(Second:(Second:($t@21@00))))) == Null | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 39 | First:(Second:(First:(Second:(Second:($t@21@00))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
  $Snap.unit))
; [eval] (unfolding acc(Lseg(this.next, end), write) in this.next != end ==> prio(this.data) <= prio(this.next.data))
(push) ; 7
(assert (Lseg%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))) end@20@00))
; [eval] this != end
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
  end@20@00)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
    end@20@00))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 40 | First:(Second:(First:(Second:(Second:($t@21@00))))) != end@20@00 | live]
; [else-branch: 40 | First:(Second:(First:(Second:(Second:($t@21@00))))) == end@20@00 | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 40 | First:(Second:(First:(Second:(Second:($t@21@00))))) != end@20@00]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
    end@20@00)))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))))))
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@21@00)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  this@19@00
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))))))
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@21@00)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  this@19@00
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] this.next != null
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 41 | First:(Second:(First:(Second:(Second:(First:(Second:(Second:($t@21@00)))))))) != Null | live]
; [else-branch: 41 | First:(Second:(First:(Second:(Second:(First:(Second:(Second:($t@21@00)))))))) == Null | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 41 | First:(Second:(First:(Second:(Second:(First:(Second:(Second:($t@21@00)))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))))
  $Snap.unit))
; [eval] (unfolding acc(Lseg(this.next, end), write) in this.next != end ==> prio(this.data) <= prio(this.next.data))
(declare-const recunf@22@00 Bool)
(assert (as recunf@22@00  Bool))
; [eval] this.next != end ==> prio(this.data) <= prio(this.next.data)
; [eval] this.next != end
(push) ; 10
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
  end@20@00)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 42 | First:(Second:(First:(Second:(Second:($t@21@00))))) != end@20@00 | live]
; [else-branch: 42 | First:(Second:(First:(Second:(Second:($t@21@00))))) == end@20@00 | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 42 | First:(Second:(First:(Second:(Second:($t@21@00))))) != end@20@00]
; [eval] prio(this.data) <= prio(this.next.data)
; [eval] prio(this.data)
(push) ; 12
(assert (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))
(pop) ; 12
; Joined path conditions
(assert (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))
; [eval] prio(this.next.data)
(push) ; 12
(assert (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))))))
(pop) ; 12
; Joined path conditions
(assert (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
      end@20@00))
  (and
    (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
    (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))))))))
(pop) ; 9
(push) ; 9
; [else-branch: 41 | First:(Second:(First:(Second:(Second:(First:(Second:(Second:($t@21@00)))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))))
  $Snap.unit))
; [eval] this.next != end ==> prio(this.data) <= prio(this.next.data)
; [eval] this.next != end
(push) ; 10
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
  end@20@00)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 43 | First:(Second:(First:(Second:(Second:($t@21@00))))) != end@20@00 | live]
; [else-branch: 43 | First:(Second:(First:(Second:(Second:($t@21@00))))) == end@20@00 | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 43 | First:(Second:(First:(Second:(Second:($t@21@00))))) != end@20@00]
; [eval] prio(this.data) <= prio(this.next.data)
; [eval] prio(this.data)
(push) ; 12
(assert (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))
(pop) ; 12
; Joined path conditions
(assert (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))
; [eval] prio(this.next.data)
(push) ; 12
(assert (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))))))
(pop) ; 12
; Joined path conditions
(assert (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
      end@20@00))
  (and
    (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
    (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))))))))
(pop) ; 9
(pop) ; 8
(push) ; 8
; [else-branch: 40 | First:(Second:(First:(Second:(Second:($t@21@00))))) == end@20@00]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
  end@20@00))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
  $Snap.unit))
; [eval] this.next != end ==> prio(this.data) <= prio(this.next.data)
; [eval] this.next != end
(push) ; 9
; [then-branch: 44 | First:(Second:(First:(Second:(Second:($t@21@00))))) != end@20@00 | dead]
; [else-branch: 44 | First:(Second:(First:(Second:(Second:($t@21@00))))) == end@20@00 | live]
(push) ; 10
; [else-branch: 44 | First:(Second:(First:(Second:(Second:($t@21@00))))) == end@20@00]
(pop) ; 10
(pop) ; 9
; Joined path conditions
(pop) ; 8
(pop) ; 7
(declare-const joined_unfolding@23@00 Bool)
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
        end@20@00)))
  (=
    (as joined_unfolding@23@00  Bool)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
          end@20@00))
      (<=
        (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
        (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
        end@20@00)))
  (=
    (as joined_unfolding@23@00  Bool)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
          end@20@00))
      (<=
        (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
        (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
    end@20@00)
  (= (as joined_unfolding@23@00  Bool) true)))
; Joined path conditions
(assert (Lseg%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))) end@20@00))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
      end@20@00))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
        end@20@00))
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
      ($Snap.combine
        ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))
        ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))))
    (=
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))))
        ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
        end@20@00))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))))
      $Snap.unit)
    (as recunf@22@00  Bool)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
          end@20@00))
      (and
        (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
        (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))))))))))
; Joined path conditions
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
        end@20@00))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))))
      $Snap.unit)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
          end@20@00))
      (and
        (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
        (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))))))))))
; Joined path conditions
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
    end@20@00)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
      end@20@00)
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
      $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
    end@20@00)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
        end@20@00)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
        end@20@00)))))
(assert (as joined_unfolding@23@00  Bool))
; [eval] this.next != end ==> prio(this.data) <= prio(this.next.data)
; [eval] this.next != end
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@21@00))) end@20@00)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 45 | First:(Second:($t@21@00)) != end@20@00 | live]
; [else-branch: 45 | First:(Second:($t@21@00)) == end@20@00 | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 45 | First:(Second:($t@21@00)) != end@20@00]
; [eval] prio(this.data) <= prio(this.next.data)
; [eval] prio(this.data)
(push) ; 9
(assert (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first $t@21@00))))
(pop) ; 9
; Joined path conditions
(assert (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first $t@21@00))))
; [eval] prio(this.next.data)
(push) ; 9
(assert (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))
(pop) ; 9
; Joined path conditions
(assert (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@21@00)))
      end@20@00))
  (and
    (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first $t@21@00)))
    (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))))
(pop) ; 6
(push) ; 6
; [else-branch: 39 | First:(Second:(First:(Second:(Second:($t@21@00))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))
  $Snap.unit))
; [eval] this.next != end ==> prio(this.data) <= prio(this.next.data)
; [eval] this.next != end
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@21@00))) end@20@00)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 46 | First:(Second:($t@21@00)) != end@20@00 | live]
; [else-branch: 46 | First:(Second:($t@21@00)) == end@20@00 | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 46 | First:(Second:($t@21@00)) != end@20@00]
; [eval] prio(this.data) <= prio(this.next.data)
; [eval] prio(this.data)
(push) ; 9
(assert (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first $t@21@00))))
(pop) ; 9
; Joined path conditions
(assert (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first $t@21@00))))
; [eval] prio(this.next.data)
(push) ; 9
(assert (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))
(pop) ; 9
; Joined path conditions
(assert (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@21@00)))
      end@20@00))
  (and
    (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first $t@21@00)))
    (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))))
(pop) ; 6
(pop) ; 5
(push) ; 5
; [else-branch: 38 | First:(Second:($t@21@00)) == end@20@00]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@21@00))) end@20@00))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@21@00))) $Snap.unit))
; [eval] this.next != end ==> prio(this.data) <= prio(this.next.data)
; [eval] this.next != end
(push) ; 6
; [then-branch: 47 | First:(Second:($t@21@00)) != end@20@00 | dead]
; [else-branch: 47 | First:(Second:($t@21@00)) == end@20@00 | live]
(push) ; 7
; [else-branch: 47 | First:(Second:($t@21@00)) == end@20@00]
(pop) ; 7
(pop) ; 6
; Joined path conditions
(pop) ; 5
(pop) ; 4
(declare-const joined_unfolding@24@00 Bool)
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@21@00)))
        end@20@00)))
  (=
    (as joined_unfolding@24@00  Bool)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@21@00)))
          end@20@00))
      (<=
        (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first $t@21@00)))
        (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@21@00)))
        end@20@00)))
  (=
    (as joined_unfolding@24@00  Bool)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@21@00)))
          end@20@00))
      (<=
        (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first $t@21@00)))
        (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@21@00))) end@20@00)
  (= (as joined_unfolding@24@00  Bool) true)))
; Joined path conditions
(assert (Lseg%trigger ($Snap.first ($Snap.second ($Snap.second $t@21@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@21@00))) end@20@00))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@21@00)))
      end@20@00))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@21@00)))
        end@20@00))
    (=
      ($Snap.first ($Snap.second ($Snap.second $t@21@00)))
      ($Snap.combine
        ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@00))))
        ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
    (=
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))
        ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@21@00)))
        end@20@00))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
      $Snap.unit)
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
            end@20@00)))
      (=
        (as joined_unfolding@23@00  Bool)
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
              end@20@00))
          (<=
            (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
            (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
            end@20@00)))
      (=
        (as joined_unfolding@23@00  Bool)
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
              end@20@00))
          (<=
            (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
            (prio $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))))))))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
        end@20@00)
      (= (as joined_unfolding@23@00  Bool) true))
    (Lseg%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))) end@20@00)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
          end@20@00))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
            end@20@00))
        (=
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
          ($Snap.combine
            ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))
            ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))))
        (=
          ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))))
            ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
            end@20@00))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))))
            $Ref.null)))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))))
            $Ref.null))
        (=
          ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))))))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))))
          $Snap.unit)
        (as recunf@22@00  Bool)
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
              end@20@00))
          (and
            (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
            (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
            end@20@00))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))))
          $Snap.unit)
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
              end@20@00))
          (and
            (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
            (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))))))))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
        end@20@00)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
          end@20@00)
        (=
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
          $Snap.unit)))
    (or
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
        end@20@00)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
            end@20@00)))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
            end@20@00))))
    (as joined_unfolding@23@00  Bool)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@21@00)))
          end@20@00))
      (and
        (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first $t@21@00)))
        (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))))))
; Joined path conditions
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@21@00)))
        end@20@00))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))
      $Snap.unit)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@21@00)))
          end@20@00))
      (and
        (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first $t@21@00)))
        (prio%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@21@00)))))))))))
; Joined path conditions
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@21@00))) end@20@00)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@21@00)))
      end@20@00)
    (= ($Snap.first ($Snap.second ($Snap.second $t@21@00))) $Snap.unit))))
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@21@00))) end@20@00)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@21@00)))
        end@20@00)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@21@00))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@21@00)))
        end@20@00)))))
(assert (as joined_unfolding@24@00  Bool))
(pop) ; 3
(push) ; 3
; [else-branch: 37 | First:(Second:($t@21@00)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@21@00))) $Ref.null))
(assert (= ($Snap.second ($Snap.second $t@21@00)) $Snap.unit))
(pop) ; 3
(pop) ; 2
(push) ; 2
; [else-branch: 36 | this@19@00 == end@20@00]
(assert (= this@19@00 end@20@00))
(declare-const $t@25@00 $Snap)
(assert (= $t@25@00 $Snap.unit))
(pop) ; 2
(pop) ; 1
