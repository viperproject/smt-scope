(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:10:40
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/examples/vmcai2016/linked-list-predicates-with-wands.vpr
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
(declare-sort $MWSF 0)
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
(declare-fun $SortWrappers.$MWSFTo$Snap ($MWSF) $Snap)
(declare-fun $SortWrappers.$SnapTo$MWSF ($Snap) $MWSF)
(assert (forall ((x $MWSF)) (!
    (= x ($SortWrappers.$SnapTo$MWSF($SortWrappers.$MWSFTo$Snap x)))
    :pattern (($SortWrappers.$MWSFTo$Snap x))
    :qid |$Snap.$SnapTo$MWSFTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$MWSFTo$Snap($SortWrappers.$SnapTo$MWSF x)))
    :pattern (($SortWrappers.$SnapTo$MWSF x))
    :qid |$Snap.$MWSFTo$SnapTo$MWSF|
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
(declare-fun MWSF_apply ($MWSF $Snap) $Snap)
; Declaring symbols related to program functions (from program analysis)
(declare-fun contentNodes ($Snap $Ref $Ref) Seq<Int>)
(declare-fun contentNodes%limited ($Snap $Ref $Ref) Seq<Int>)
(declare-fun contentNodes%stateless ($Ref $Ref) Bool)
(declare-fun contentNodes%precondition ($Snap $Ref $Ref) Bool)
(declare-fun lengthNodes ($Snap $Ref $Ref) Int)
(declare-fun lengthNodes%limited ($Snap $Ref $Ref) Int)
(declare-fun lengthNodes%stateless ($Ref $Ref) Bool)
(declare-fun lengthNodes%precondition ($Snap $Ref $Ref) Bool)
(declare-fun content ($Snap $Ref) Seq<Int>)
(declare-fun content%limited ($Snap $Ref) Seq<Int>)
(declare-fun content%stateless ($Ref) Bool)
(declare-fun content%precondition ($Snap $Ref) Bool)
(declare-fun length ($Snap $Ref) Int)
(declare-fun length%limited ($Snap $Ref) Int)
(declare-fun length%stateless ($Ref) Bool)
(declare-fun length%precondition ($Snap $Ref) Bool)
(declare-fun peek ($Snap $Ref) Int)
(declare-fun peek%limited ($Snap $Ref) Int)
(declare-fun peek%stateless ($Ref) Bool)
(declare-fun peek%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun lseg%trigger ($Snap $Ref $Ref) Bool)
(declare-fun List%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
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
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- FUNCTION contentNodes----------
(declare-fun this@0@00 () $Ref)
(declare-fun end@1@00 () $Ref)
(declare-fun result@2@00 () Seq<Int>)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(declare-const $t@12@00 $Snap)
(assert (= $t@12@00 ($Snap.combine ($Snap.first $t@12@00) ($Snap.second $t@12@00))))
(assert (= ($Snap.first $t@12@00) $Snap.unit))
; [eval] this == end ==> result == Seq[Int]()
; [eval] this == end
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= this@0@00 end@1@00))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= this@0@00 end@1@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | this@0@00 == end@1@00 | live]
; [else-branch: 0 | this@0@00 != end@1@00 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | this@0@00 == end@1@00]
(assert (= this@0@00 end@1@00))
; [eval] result == Seq[Int]()
; [eval] Seq[Int]()
(pop) ; 3
(push) ; 3
; [else-branch: 0 | this@0@00 != end@1@00]
(assert (not (= this@0@00 end@1@00)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (not (= this@0@00 end@1@00)) (= this@0@00 end@1@00)))
(assert (=> (= this@0@00 end@1@00) (Seq_equal result@2@00 (as Seq_empty  Seq<Int>))))
(assert (=
  ($Snap.second $t@12@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@12@00))
    ($Snap.second ($Snap.second $t@12@00)))))
(assert (= ($Snap.first ($Snap.second $t@12@00)) $Snap.unit))
; [eval] this != end ==> |result| > 0 && result[0] == (unfolding acc(lseg(this, end), write) in this.data)
; [eval] this != end
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (= this@0@00 end@1@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= this@0@00 end@1@00))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | this@0@00 != end@1@00 | live]
; [else-branch: 1 | this@0@00 == end@1@00 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | this@0@00 != end@1@00]
(assert (not (= this@0@00 end@1@00)))
; [eval] |result| > 0 && result[0] == (unfolding acc(lseg(this, end), write) in this.data)
; [eval] |result| > 0
; [eval] |result|
(push) ; 4
; [then-branch: 2 | !(|result@2@00| > 0) | live]
; [else-branch: 2 | |result@2@00| > 0 | live]
(push) ; 5
; [then-branch: 2 | !(|result@2@00| > 0)]
(assert (not (> (Seq_length result@2@00) 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 2 | |result@2@00| > 0]
(assert (> (Seq_length result@2@00) 0))
; [eval] result[0] == (unfolding acc(lseg(this, end), write) in this.data)
; [eval] result[0]
(push) ; 6
(assert (not (< 0 (Seq_length result@2@00))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] (unfolding acc(lseg(this, end), write) in this.data)
(push) ; 6
(assert (lseg%trigger s@$ this@0@00 end@1@00))
; [eval] this != end
(push) ; 7
(set-option :timeout 10)
(assert (not (= this@0@00 end@1@00)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | this@0@00 != end@1@00 | live]
; [else-branch: 3 | this@0@00 == end@1@00 | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 3 | this@0@00 != end@1@00]
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= this@0@00 $Ref.null)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] (unfolding acc(lseg(this.next, end), write) in this.next != end ==> this.data <= this.next.data)
(push) ; 8
(assert (lseg%trigger ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00))
; [eval] this != end
(push) ; 9
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | First:(Second:(s@$)) != end@1@00 | live]
; [else-branch: 4 | First:(Second:(s@$)) == end@1@00 | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 4 | First:(Second:(s@$)) != end@1@00]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))))
(push) ; 10
(set-option :timeout 10)
(assert (not (= this@0@00 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))))
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= this@0@00 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
  $Snap.unit))
; [eval] (unfolding acc(lseg(this.next, end), write) in this.next != end ==> this.data <= this.next.data)
(declare-fun recunf@13@00 ($Snap $Ref $Ref) Bool)
(assert (recunf@13@00 s@$ this@0@00 end@1@00))
; [eval] this.next != end ==> this.data <= this.next.data
; [eval] this.next != end
(set-option :timeout 0)
(push) ; 10
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | First:(Second:(s@$)) != end@1@00 | live]
; [else-branch: 5 | First:(Second:(s@$)) == end@1@00 | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 5 | First:(Second:(s@$)) != end@1@00]
; [eval] this.data <= this.next.data
(pop) ; 11
(pop) ; 10
; Joined path conditions
(pop) ; 9
(push) ; 9
; [else-branch: 4 | First:(Second:(s@$)) == end@1@00]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] this.next != end ==> this.data <= this.next.data
; [eval] this.next != end
(push) ; 10
; [then-branch: 6 | First:(Second:(s@$)) != end@1@00 | dead]
; [else-branch: 6 | First:(Second:(s@$)) == end@1@00 | live]
(push) ; 11
; [else-branch: 6 | First:(Second:(s@$)) == end@1@00]
(pop) ; 11
(pop) ; 10
; Joined path conditions
(pop) ; 9
(pop) ; 8
(declare-fun joined_unfolding@14@00 ($Snap $Ref $Ref) Bool)
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00))
  (=
    (joined_unfolding@14@00 s@$ this@0@00 end@1@00)
    (=>
      (not
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00))
      (<=
        ($SortWrappers.$SnapToInt ($Snap.first s@$))
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)
  (= (joined_unfolding@14@00 s@$ this@0@00 end@1@00) true)))
; Joined path conditions
(assert (lseg%trigger ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00))
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00))
  (and
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00))
    (=
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.combine
        ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))
        ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
    (=
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
        ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))))
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
      $Snap.unit)
    (recunf@13@00 s@$ this@0@00 end@1@00))))
; Joined path conditions
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)
  (and
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)
    (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))))
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00))))
(assert (joined_unfolding@14@00 s@$ this@0@00 end@1@00))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (lseg%trigger s@$ this@0@00 end@1@00))
(assert (=>
  (not (= this@0@00 end@1@00))
  (and
    (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
    (not (= this@0@00 $Ref.null))
    (=
      ($Snap.second s@$)
      ($Snap.combine
        ($Snap.first ($Snap.second s@$))
        ($Snap.second ($Snap.second s@$))))
    (=
      ($Snap.second ($Snap.second s@$))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second s@$)))
        ($Snap.second ($Snap.second ($Snap.second s@$)))))
    (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit)
    (=>
      (not
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00))
      (=
        (joined_unfolding@14@00 s@$ this@0@00 end@1@00)
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              end@1@00))
          (<=
            ($SortWrappers.$SnapToInt ($Snap.first s@$))
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
    (=>
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)
      (= (joined_unfolding@14@00 s@$ this@0@00 end@1@00) true))
    (lseg%trigger ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)
    (=>
      (not
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            end@1@00))
        (=
          ($Snap.first ($Snap.second ($Snap.second s@$)))
          ($Snap.combine
            ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))
            ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            $Ref.null))
        (=
          ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
            ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))))
        (=
          ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
          $Snap.unit)
        (recunf@13@00 s@$ this@0@00 end@1@00)))
    (=>
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)
      (and
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)
        (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit)))
    (or
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)
      (not
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)))
    (joined_unfolding@14@00 s@$ this@0@00 end@1@00))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (> (Seq_length result@2@00) 0)
  (and
    (> (Seq_length result@2@00) 0)
    (lseg%trigger s@$ this@0@00 end@1@00)
    (=>
      (not (= this@0@00 end@1@00))
      (and
        (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
        (not (= this@0@00 $Ref.null))
        (=
          ($Snap.second s@$)
          ($Snap.combine
            ($Snap.first ($Snap.second s@$))
            ($Snap.second ($Snap.second s@$))))
        (=
          ($Snap.second ($Snap.second s@$))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second s@$)))
            ($Snap.second ($Snap.second ($Snap.second s@$)))))
        (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit)
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              end@1@00))
          (=
            (joined_unfolding@14@00 s@$ this@0@00 end@1@00)
            (=>
              (not
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                  end@1@00))
              (<=
                ($SortWrappers.$SnapToInt ($Snap.first s@$))
                ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            end@1@00)
          (= (joined_unfolding@14@00 s@$ this@0@00 end@1@00) true))
        (lseg%trigger ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              end@1@00))
          (and
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                end@1@00))
            (=
              ($Snap.first ($Snap.second ($Snap.second s@$)))
              ($Snap.combine
                ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))
                ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                $Ref.null))
            (=
              ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
                ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))))
            (=
              ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
                ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))))
            (=
              ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
              $Snap.unit)
            (recunf@13@00 s@$ this@0@00 end@1@00)))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            end@1@00)
          (and
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              end@1@00)
            (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit)))
        (or
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            end@1@00)
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              end@1@00)))
        (joined_unfolding@14@00 s@$ this@0@00 end@1@00))))))
(assert (or (> (Seq_length result@2@00) 0) (not (> (Seq_length result@2@00) 0))))
(pop) ; 3
(push) ; 3
; [else-branch: 1 | this@0@00 == end@1@00]
(assert (= this@0@00 end@1@00))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=>
  (not (= this@0@00 end@1@00))
  (and
    (not (= this@0@00 end@1@00))
    (=>
      (> (Seq_length result@2@00) 0)
      (and
        (> (Seq_length result@2@00) 0)
        (lseg%trigger s@$ this@0@00 end@1@00)
        (=>
          (not (= this@0@00 end@1@00))
          (and
            (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
            (not (= this@0@00 $Ref.null))
            (=
              ($Snap.second s@$)
              ($Snap.combine
                ($Snap.first ($Snap.second s@$))
                ($Snap.second ($Snap.second s@$))))
            (=
              ($Snap.second ($Snap.second s@$))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second s@$)))
                ($Snap.second ($Snap.second ($Snap.second s@$)))))
            (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit)
            (=>
              (not
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                  end@1@00))
              (=
                (joined_unfolding@14@00 s@$ this@0@00 end@1@00)
                (=>
                  (not
                    (=
                      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                      end@1@00))
                  (<=
                    ($SortWrappers.$SnapToInt ($Snap.first s@$))
                    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
            (=>
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                end@1@00)
              (= (joined_unfolding@14@00 s@$ this@0@00 end@1@00) true))
            (lseg%trigger ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)
            (=>
              (not
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                  end@1@00))
              (and
                (not
                  (=
                    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                    end@1@00))
                (=
                  ($Snap.first ($Snap.second ($Snap.second s@$)))
                  ($Snap.combine
                    ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))
                    ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
                (not
                  (=
                    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                    $Ref.null))
                (=
                  ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
                    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))))
                (=
                  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
                    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))))
                (=
                  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
                  $Snap.unit)
                (recunf@13@00 s@$ this@0@00 end@1@00)))
            (=>
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                end@1@00)
              (and
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                  end@1@00)
                (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit)))
            (or
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                end@1@00)
              (not
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                  end@1@00)))
            (joined_unfolding@14@00 s@$ this@0@00 end@1@00)))))
    (or (> (Seq_length result@2@00) 0) (not (> (Seq_length result@2@00) 0))))))
; Joined path conditions
(assert (or (= this@0@00 end@1@00) (not (= this@0@00 end@1@00))))
(assert (=>
  (not (= this@0@00 end@1@00))
  (and
    (> (Seq_length result@2@00) 0)
    (= (Seq_index result@2@00 0) ($SortWrappers.$SnapToInt ($Snap.first s@$))))))
(assert (= ($Snap.second ($Snap.second $t@12@00)) $Snap.unit))
; [eval] (forall i: Int, j: Int :: { result[i], result[j] } 0 <= i && (i < j && j < |result|) ==> result[i] <= result[j])
(declare-const i@15@00 Int)
(declare-const j@16@00 Int)
(push) ; 2
; [eval] 0 <= i && (i < j && j < |result|) ==> result[i] <= result[j]
; [eval] 0 <= i && (i < j && j < |result|)
; [eval] 0 <= i
(push) ; 3
; [then-branch: 7 | !(0 <= i@15@00) | live]
; [else-branch: 7 | 0 <= i@15@00 | live]
(push) ; 4
; [then-branch: 7 | !(0 <= i@15@00)]
(assert (not (<= 0 i@15@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 7 | 0 <= i@15@00]
(assert (<= 0 i@15@00))
; [eval] i < j
(push) ; 5
; [then-branch: 8 | !(i@15@00 < j@16@00) | live]
; [else-branch: 8 | i@15@00 < j@16@00 | live]
(push) ; 6
; [then-branch: 8 | !(i@15@00 < j@16@00)]
(assert (not (< i@15@00 j@16@00)))
(pop) ; 6
(push) ; 6
; [else-branch: 8 | i@15@00 < j@16@00]
(assert (< i@15@00 j@16@00))
; [eval] j < |result|
; [eval] |result|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (< i@15@00 j@16@00) (not (< i@15@00 j@16@00))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@15@00)
  (and (<= 0 i@15@00) (or (< i@15@00 j@16@00) (not (< i@15@00 j@16@00))))))
(assert (or (<= 0 i@15@00) (not (<= 0 i@15@00))))
(push) ; 3
; [then-branch: 9 | 0 <= i@15@00 && i@15@00 < j@16@00 && j@16@00 < |result@2@00| | live]
; [else-branch: 9 | !(0 <= i@15@00 && i@15@00 < j@16@00 && j@16@00 < |result@2@00|) | live]
(push) ; 4
; [then-branch: 9 | 0 <= i@15@00 && i@15@00 < j@16@00 && j@16@00 < |result@2@00|]
(assert (and
  (<= 0 i@15@00)
  (and (< i@15@00 j@16@00) (< j@16@00 (Seq_length result@2@00)))))
; [eval] result[i] <= result[j]
; [eval] result[i]
(push) ; 5
(assert (not (>= i@15@00 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@15@00 (Seq_length result@2@00))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] result[j]
(push) ; 5
(assert (not (>= j@16@00 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 9 | !(0 <= i@15@00 && i@15@00 < j@16@00 && j@16@00 < |result@2@00|)]
(assert (not
  (and
    (<= 0 i@15@00)
    (and (< i@15@00 j@16@00) (< j@16@00 (Seq_length result@2@00))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@15@00)
    (and (< i@15@00 j@16@00) (< j@16@00 (Seq_length result@2@00))))
  (and (<= 0 i@15@00) (< i@15@00 j@16@00) (< j@16@00 (Seq_length result@2@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@15@00)
      (and (< i@15@00 j@16@00) (< j@16@00 (Seq_length result@2@00)))))
  (and
    (<= 0 i@15@00)
    (and (< i@15@00 j@16@00) (< j@16@00 (Seq_length result@2@00))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@15@00 Int) (j@16@00 Int)) (!
  (and
    (=>
      (<= 0 i@15@00)
      (and (<= 0 i@15@00) (or (< i@15@00 j@16@00) (not (< i@15@00 j@16@00)))))
    (or (<= 0 i@15@00) (not (<= 0 i@15@00)))
    (=>
      (and
        (<= 0 i@15@00)
        (and (< i@15@00 j@16@00) (< j@16@00 (Seq_length result@2@00))))
      (and
        (<= 0 i@15@00)
        (< i@15@00 j@16@00)
        (< j@16@00 (Seq_length result@2@00))))
    (or
      (not
        (and
          (<= 0 i@15@00)
          (and (< i@15@00 j@16@00) (< j@16@00 (Seq_length result@2@00)))))
      (and
        (<= 0 i@15@00)
        (and (< i@15@00 j@16@00) (< j@16@00 (Seq_length result@2@00))))))
  :pattern ((Seq_index result@2@00 i@15@00) (Seq_index result@2@00 j@16@00))
  :qid |prog./silicon/silver/src/test/resources/examples/vmcai2016/linked-list-predicates-with-wands.vpr@25@12@25@95-aux|)))
(assert (forall ((i@15@00 Int) (j@16@00 Int)) (!
  (=>
    (and
      (<= 0 i@15@00)
      (and (< i@15@00 j@16@00) (< j@16@00 (Seq_length result@2@00))))
    (<= (Seq_index result@2@00 i@15@00) (Seq_index result@2@00 j@16@00)))
  :pattern ((Seq_index result@2@00 i@15@00) (Seq_index result@2@00 j@16@00))
  :qid |prog./silicon/silver/src/test/resources/examples/vmcai2016/linked-list-predicates-with-wands.vpr@25@12@25@95|)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@0@00 $Ref) (end@1@00 $Ref)) (!
  (=
    (contentNodes%limited s@$ this@0@00 end@1@00)
    (contentNodes s@$ this@0@00 end@1@00))
  :pattern ((contentNodes s@$ this@0@00 end@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref) (end@1@00 $Ref)) (!
  (contentNodes%stateless this@0@00 end@1@00)
  :pattern ((contentNodes%limited s@$ this@0@00 end@1@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref) (end@1@00 $Ref)) (!
  (let ((result@2@00 (contentNodes%limited s@$ this@0@00 end@1@00))) (=>
    (contentNodes%precondition s@$ this@0@00 end@1@00)
    (and
      (=>
        (= this@0@00 end@1@00)
        (Seq_equal result@2@00 (as Seq_empty  Seq<Int>)))
      (=>
        (not (= this@0@00 end@1@00))
        (and
          (> (Seq_length result@2@00) 0)
          (=
            (Seq_index result@2@00 0)
            ($SortWrappers.$SnapToInt ($Snap.first s@$)))))
      (forall ((i Int) (j Int)) (!
        (=>
          (and (<= 0 i) (and (< i j) (< j (Seq_length result@2@00))))
          (<= (Seq_index result@2@00 i) (Seq_index result@2@00 j)))
        :pattern ((Seq_index result@2@00 i) (Seq_index result@2@00 j))
        )))))
  :pattern ((contentNodes%limited s@$ this@0@00 end@1@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref) (end@1@00 $Ref)) (!
  (let ((result@2@00 (contentNodes%limited s@$ this@0@00 end@1@00))) true)
  :pattern ((contentNodes%limited s@$ this@0@00 end@1@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref) (end@1@00 $Ref)) (!
  (let ((result@2@00 (contentNodes%limited s@$ this@0@00 end@1@00))) true)
  :pattern ((contentNodes%limited s@$ this@0@00 end@1@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref) (end@1@00 $Ref)) (!
  (let ((result@2@00 (contentNodes%limited s@$ this@0@00 end@1@00))) true)
  :pattern ((contentNodes%limited s@$ this@0@00 end@1@00))
  :qid |quant-u-13|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (this == end ? Seq[Int]() : (unfolding acc(lseg(this, end), write) in Seq(this.data) ++ contentNodes(this.next, end)))
; [eval] this == end
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= this@0@00 end@1@00))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= this@0@00 end@1@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | this@0@00 == end@1@00 | live]
; [else-branch: 10 | this@0@00 != end@1@00 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 10 | this@0@00 == end@1@00]
(assert (= this@0@00 end@1@00))
; [eval] Seq[Int]()
(pop) ; 3
(push) ; 3
; [else-branch: 10 | this@0@00 != end@1@00]
(assert (not (= this@0@00 end@1@00)))
; [eval] (unfolding acc(lseg(this, end), write) in Seq(this.data) ++ contentNodes(this.next, end))
(push) ; 4
(assert (lseg%trigger s@$ this@0@00 end@1@00))
; [eval] this != end
(push) ; 5
(set-option :timeout 10)
(assert (not (= this@0@00 end@1@00)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | this@0@00 != end@1@00 | live]
; [else-branch: 11 | this@0@00 == end@1@00 | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 11 | this@0@00 != end@1@00]
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= this@0@00 $Ref.null)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] (unfolding acc(lseg(this.next, end), write) in this.next != end ==> this.data <= this.next.data)
(push) ; 6
(assert (lseg%trigger ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00))
; [eval] this != end
(push) ; 7
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | First:(Second:(s@$)) != end@1@00 | live]
; [else-branch: 12 | First:(Second:(s@$)) == end@1@00 | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 12 | First:(Second:(s@$)) != end@1@00]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))))
(push) ; 8
(set-option :timeout 10)
(assert (not (= this@0@00 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= this@0@00 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
  $Snap.unit))
; [eval] (unfolding acc(lseg(this.next, end), write) in this.next != end ==> this.data <= this.next.data)
(declare-fun recunf@17@00 ($Snap $Ref $Ref) Bool)
(assert (recunf@17@00 s@$ this@0@00 end@1@00))
; [eval] this.next != end ==> this.data <= this.next.data
; [eval] this.next != end
(set-option :timeout 0)
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | First:(Second:(s@$)) != end@1@00 | live]
; [else-branch: 13 | First:(Second:(s@$)) == end@1@00 | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 13 | First:(Second:(s@$)) != end@1@00]
; [eval] this.data <= this.next.data
(pop) ; 9
(pop) ; 8
; Joined path conditions
(pop) ; 7
(push) ; 7
; [else-branch: 12 | First:(Second:(s@$)) == end@1@00]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] this.next != end ==> this.data <= this.next.data
; [eval] this.next != end
(push) ; 8
; [then-branch: 14 | First:(Second:(s@$)) != end@1@00 | dead]
; [else-branch: 14 | First:(Second:(s@$)) == end@1@00 | live]
(push) ; 9
; [else-branch: 14 | First:(Second:(s@$)) == end@1@00]
(pop) ; 9
(pop) ; 8
; Joined path conditions
(pop) ; 7
(pop) ; 6
(declare-fun joined_unfolding@18@00 ($Snap $Ref $Ref) Bool)
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00))
  (=
    (joined_unfolding@18@00 s@$ this@0@00 end@1@00)
    (=>
      (not
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00))
      (<=
        ($SortWrappers.$SnapToInt ($Snap.first s@$))
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)
  (= (joined_unfolding@18@00 s@$ this@0@00 end@1@00) true)))
; Joined path conditions
(assert (lseg%trigger ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00))
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00))
  (and
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00))
    (=
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.combine
        ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))
        ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
    (=
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
        ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))))
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
      $Snap.unit)
    (recunf@17@00 s@$ this@0@00 end@1@00))))
; Joined path conditions
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)
  (and
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)
    (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))))
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00))))
(assert (joined_unfolding@18@00 s@$ this@0@00 end@1@00))
; [eval] Seq(this.data) ++ contentNodes(this.next, end)
; [eval] Seq(this.data)
(assert (= (Seq_length (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first s@$)))) 1))
; [eval] contentNodes(this.next, end)
(push) ; 6
(assert (contentNodes%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00))
(pop) ; 6
; Joined path conditions
(assert (contentNodes%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (lseg%trigger s@$ this@0@00 end@1@00))
(assert (=>
  (not (= this@0@00 end@1@00))
  (and
    (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
    (not (= this@0@00 $Ref.null))
    (=
      ($Snap.second s@$)
      ($Snap.combine
        ($Snap.first ($Snap.second s@$))
        ($Snap.second ($Snap.second s@$))))
    (=
      ($Snap.second ($Snap.second s@$))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second s@$)))
        ($Snap.second ($Snap.second ($Snap.second s@$)))))
    (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit)
    (=>
      (not
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00))
      (=
        (joined_unfolding@18@00 s@$ this@0@00 end@1@00)
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              end@1@00))
          (<=
            ($SortWrappers.$SnapToInt ($Snap.first s@$))
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
    (=>
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)
      (= (joined_unfolding@18@00 s@$ this@0@00 end@1@00) true))
    (lseg%trigger ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)
    (=>
      (not
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            end@1@00))
        (=
          ($Snap.first ($Snap.second ($Snap.second s@$)))
          ($Snap.combine
            ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))
            ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            $Ref.null))
        (=
          ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
            ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))))
        (=
          ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
          $Snap.unit)
        (recunf@17@00 s@$ this@0@00 end@1@00)))
    (=>
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)
      (and
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)
        (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit)))
    (or
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)
      (not
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)))
    (joined_unfolding@18@00 s@$ this@0@00 end@1@00)
    (=
      (Seq_length (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first s@$))))
      1)
    (contentNodes%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= this@0@00 end@1@00))
  (and
    (not (= this@0@00 end@1@00))
    (lseg%trigger s@$ this@0@00 end@1@00)
    (=>
      (not (= this@0@00 end@1@00))
      (and
        (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
        (not (= this@0@00 $Ref.null))
        (=
          ($Snap.second s@$)
          ($Snap.combine
            ($Snap.first ($Snap.second s@$))
            ($Snap.second ($Snap.second s@$))))
        (=
          ($Snap.second ($Snap.second s@$))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second s@$)))
            ($Snap.second ($Snap.second ($Snap.second s@$)))))
        (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit)
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              end@1@00))
          (=
            (joined_unfolding@18@00 s@$ this@0@00 end@1@00)
            (=>
              (not
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                  end@1@00))
              (<=
                ($SortWrappers.$SnapToInt ($Snap.first s@$))
                ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            end@1@00)
          (= (joined_unfolding@18@00 s@$ this@0@00 end@1@00) true))
        (lseg%trigger ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              end@1@00))
          (and
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                end@1@00))
            (=
              ($Snap.first ($Snap.second ($Snap.second s@$)))
              ($Snap.combine
                ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))
                ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                $Ref.null))
            (=
              ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
                ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))))
            (=
              ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
                ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))))
            (=
              ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
              $Snap.unit)
            (recunf@17@00 s@$ this@0@00 end@1@00)))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            end@1@00)
          (and
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              end@1@00)
            (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit)))
        (or
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            end@1@00)
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              end@1@00)))
        (joined_unfolding@18@00 s@$ this@0@00 end@1@00)
        (=
          (Seq_length
            (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first s@$))))
          1)
        (contentNodes%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00))))))
(assert (or (not (= this@0@00 end@1@00)) (= this@0@00 end@1@00)))
(assert (=
  result@2@00
  (ite
    (= this@0@00 end@1@00)
    (as Seq_empty  Seq<Int>)
    (Seq_append
      (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first s@$)))
      (contentNodes ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)))))
; [eval] this == end ==> result == Seq[Int]()
; [eval] this == end
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= this@0@00 end@1@00))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= this@0@00 end@1@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | this@0@00 == end@1@00 | live]
; [else-branch: 15 | this@0@00 != end@1@00 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 15 | this@0@00 == end@1@00]
(assert (= this@0@00 end@1@00))
; [eval] result == Seq[Int]()
; [eval] Seq[Int]()
(pop) ; 3
(push) ; 3
; [else-branch: 15 | this@0@00 != end@1@00]
(assert (not (= this@0@00 end@1@00)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(push) ; 2
(assert (not (=> (= this@0@00 end@1@00) (Seq_equal result@2@00 (as Seq_empty  Seq<Int>)))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=> (= this@0@00 end@1@00) (Seq_equal result@2@00 (as Seq_empty  Seq<Int>))))
; [eval] this != end ==> |result| > 0 && result[0] == (unfolding acc(lseg(this, end), write) in this.data)
; [eval] this != end
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (= this@0@00 end@1@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= this@0@00 end@1@00))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 16 | this@0@00 != end@1@00 | live]
; [else-branch: 16 | this@0@00 == end@1@00 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 16 | this@0@00 != end@1@00]
(assert (not (= this@0@00 end@1@00)))
; [eval] |result| > 0 && result[0] == (unfolding acc(lseg(this, end), write) in this.data)
; [eval] |result| > 0
; [eval] |result|
(push) ; 4
; [then-branch: 17 | !(|result@2@00| > 0) | live]
; [else-branch: 17 | |result@2@00| > 0 | live]
(push) ; 5
; [then-branch: 17 | !(|result@2@00| > 0)]
(assert (not (> (Seq_length result@2@00) 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 17 | |result@2@00| > 0]
(assert (> (Seq_length result@2@00) 0))
; [eval] result[0] == (unfolding acc(lseg(this, end), write) in this.data)
; [eval] result[0]
(push) ; 6
(assert (not (< 0 (Seq_length result@2@00))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] (unfolding acc(lseg(this, end), write) in this.data)
(push) ; 6
(assert (lseg%trigger s@$ this@0@00 end@1@00))
; [eval] this != end
(push) ; 7
(set-option :timeout 10)
(assert (not (= this@0@00 end@1@00)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 18 | this@0@00 != end@1@00 | live]
; [else-branch: 18 | this@0@00 == end@1@00 | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 18 | this@0@00 != end@1@00]
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= this@0@00 $Ref.null)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] (unfolding acc(lseg(this.next, end), write) in this.next != end ==> this.data <= this.next.data)
(push) ; 8
(assert (lseg%trigger ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00))
; [eval] this != end
(push) ; 9
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 19 | First:(Second:(s@$)) != end@1@00 | live]
; [else-branch: 19 | First:(Second:(s@$)) == end@1@00 | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 19 | First:(Second:(s@$)) != end@1@00]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))))
(push) ; 10
(set-option :timeout 10)
(assert (not (= this@0@00 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))))
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= this@0@00 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
  $Snap.unit))
; [eval] (unfolding acc(lseg(this.next, end), write) in this.next != end ==> this.data <= this.next.data)
(declare-fun recunf@19@00 ($Snap $Ref $Ref) Bool)
(assert (recunf@19@00 s@$ this@0@00 end@1@00))
; [eval] this.next != end ==> this.data <= this.next.data
; [eval] this.next != end
(set-option :timeout 0)
(push) ; 10
(push) ; 11
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 20 | First:(Second:(s@$)) != end@1@00 | live]
; [else-branch: 20 | First:(Second:(s@$)) == end@1@00 | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 20 | First:(Second:(s@$)) != end@1@00]
; [eval] this.data <= this.next.data
(pop) ; 11
(pop) ; 10
; Joined path conditions
(pop) ; 9
(push) ; 9
; [else-branch: 19 | First:(Second:(s@$)) == end@1@00]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] this.next != end ==> this.data <= this.next.data
; [eval] this.next != end
(push) ; 10
; [then-branch: 21 | First:(Second:(s@$)) != end@1@00 | dead]
; [else-branch: 21 | First:(Second:(s@$)) == end@1@00 | live]
(push) ; 11
; [else-branch: 21 | First:(Second:(s@$)) == end@1@00]
(pop) ; 11
(pop) ; 10
; Joined path conditions
(pop) ; 9
(pop) ; 8
(declare-fun joined_unfolding@20@00 ($Snap $Ref $Ref) Bool)
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00))
  (=
    (joined_unfolding@20@00 s@$ this@0@00 end@1@00)
    (=>
      (not
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00))
      (<=
        ($SortWrappers.$SnapToInt ($Snap.first s@$))
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)
  (= (joined_unfolding@20@00 s@$ this@0@00 end@1@00) true)))
; Joined path conditions
(assert (lseg%trigger ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00))
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00))
  (and
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00))
    (=
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.combine
        ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))
        ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
    (=
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
        ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))))
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
      $Snap.unit)
    (recunf@19@00 s@$ this@0@00 end@1@00))))
; Joined path conditions
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)
  (and
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)
    (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))))
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00))))
(assert (joined_unfolding@20@00 s@$ this@0@00 end@1@00))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (lseg%trigger s@$ this@0@00 end@1@00))
(assert (=>
  (not (= this@0@00 end@1@00))
  (and
    (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
    (not (= this@0@00 $Ref.null))
    (=
      ($Snap.second s@$)
      ($Snap.combine
        ($Snap.first ($Snap.second s@$))
        ($Snap.second ($Snap.second s@$))))
    (=
      ($Snap.second ($Snap.second s@$))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second s@$)))
        ($Snap.second ($Snap.second ($Snap.second s@$)))))
    (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit)
    (=>
      (not
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00))
      (=
        (joined_unfolding@20@00 s@$ this@0@00 end@1@00)
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              end@1@00))
          (<=
            ($SortWrappers.$SnapToInt ($Snap.first s@$))
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
    (=>
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)
      (= (joined_unfolding@20@00 s@$ this@0@00 end@1@00) true))
    (lseg%trigger ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)
    (=>
      (not
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            end@1@00))
        (=
          ($Snap.first ($Snap.second ($Snap.second s@$)))
          ($Snap.combine
            ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))
            ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            $Ref.null))
        (=
          ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
            ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))))
        (=
          ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
          $Snap.unit)
        (recunf@19@00 s@$ this@0@00 end@1@00)))
    (=>
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)
      (and
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)
        (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit)))
    (or
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)
      (not
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)))
    (joined_unfolding@20@00 s@$ this@0@00 end@1@00))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (> (Seq_length result@2@00) 0)
  (and
    (> (Seq_length result@2@00) 0)
    (lseg%trigger s@$ this@0@00 end@1@00)
    (=>
      (not (= this@0@00 end@1@00))
      (and
        (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
        (not (= this@0@00 $Ref.null))
        (=
          ($Snap.second s@$)
          ($Snap.combine
            ($Snap.first ($Snap.second s@$))
            ($Snap.second ($Snap.second s@$))))
        (=
          ($Snap.second ($Snap.second s@$))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second s@$)))
            ($Snap.second ($Snap.second ($Snap.second s@$)))))
        (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit)
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              end@1@00))
          (=
            (joined_unfolding@20@00 s@$ this@0@00 end@1@00)
            (=>
              (not
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                  end@1@00))
              (<=
                ($SortWrappers.$SnapToInt ($Snap.first s@$))
                ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            end@1@00)
          (= (joined_unfolding@20@00 s@$ this@0@00 end@1@00) true))
        (lseg%trigger ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              end@1@00))
          (and
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                end@1@00))
            (=
              ($Snap.first ($Snap.second ($Snap.second s@$)))
              ($Snap.combine
                ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))
                ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                $Ref.null))
            (=
              ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
                ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))))
            (=
              ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
                ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))))
            (=
              ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
              $Snap.unit)
            (recunf@19@00 s@$ this@0@00 end@1@00)))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            end@1@00)
          (and
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              end@1@00)
            (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit)))
        (or
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            end@1@00)
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              end@1@00)))
        (joined_unfolding@20@00 s@$ this@0@00 end@1@00))))))
(assert (or (> (Seq_length result@2@00) 0) (not (> (Seq_length result@2@00) 0))))
(pop) ; 3
(push) ; 3
; [else-branch: 16 | this@0@00 == end@1@00]
(assert (= this@0@00 end@1@00))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=>
  (not (= this@0@00 end@1@00))
  (and
    (not (= this@0@00 end@1@00))
    (=>
      (> (Seq_length result@2@00) 0)
      (and
        (> (Seq_length result@2@00) 0)
        (lseg%trigger s@$ this@0@00 end@1@00)
        (=>
          (not (= this@0@00 end@1@00))
          (and
            (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
            (not (= this@0@00 $Ref.null))
            (=
              ($Snap.second s@$)
              ($Snap.combine
                ($Snap.first ($Snap.second s@$))
                ($Snap.second ($Snap.second s@$))))
            (=
              ($Snap.second ($Snap.second s@$))
              ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second s@$)))
                ($Snap.second ($Snap.second ($Snap.second s@$)))))
            (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit)
            (=>
              (not
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                  end@1@00))
              (=
                (joined_unfolding@20@00 s@$ this@0@00 end@1@00)
                (=>
                  (not
                    (=
                      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                      end@1@00))
                  (<=
                    ($SortWrappers.$SnapToInt ($Snap.first s@$))
                    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
            (=>
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                end@1@00)
              (= (joined_unfolding@20@00 s@$ this@0@00 end@1@00) true))
            (lseg%trigger ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)
            (=>
              (not
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                  end@1@00))
              (and
                (not
                  (=
                    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                    end@1@00))
                (=
                  ($Snap.first ($Snap.second ($Snap.second s@$)))
                  ($Snap.combine
                    ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))
                    ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
                (not
                  (=
                    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                    $Ref.null))
                (=
                  ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
                    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))))
                (=
                  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
                    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))))
                (=
                  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
                  $Snap.unit)
                (recunf@19@00 s@$ this@0@00 end@1@00)))
            (=>
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                end@1@00)
              (and
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                  end@1@00)
                (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit)))
            (or
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                end@1@00)
              (not
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                  end@1@00)))
            (joined_unfolding@20@00 s@$ this@0@00 end@1@00)))))
    (or (> (Seq_length result@2@00) 0) (not (> (Seq_length result@2@00) 0))))))
; Joined path conditions
(assert (or (= this@0@00 end@1@00) (not (= this@0@00 end@1@00))))
(push) ; 2
(assert (not (=>
  (not (= this@0@00 end@1@00))
  (and
    (> (Seq_length result@2@00) 0)
    (= (Seq_index result@2@00 0) ($SortWrappers.$SnapToInt ($Snap.first s@$)))))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (not (= this@0@00 end@1@00))
  (and
    (> (Seq_length result@2@00) 0)
    (= (Seq_index result@2@00 0) ($SortWrappers.$SnapToInt ($Snap.first s@$))))))
; [eval] (forall i: Int, j: Int :: { result[i], result[j] } 0 <= i && (i < j && j < |result|) ==> result[i] <= result[j])
(declare-const i@21@00 Int)
(declare-const j@22@00 Int)
(push) ; 2
; [eval] 0 <= i && (i < j && j < |result|) ==> result[i] <= result[j]
; [eval] 0 <= i && (i < j && j < |result|)
; [eval] 0 <= i
(push) ; 3
; [then-branch: 22 | !(0 <= i@21@00) | live]
; [else-branch: 22 | 0 <= i@21@00 | live]
(push) ; 4
; [then-branch: 22 | !(0 <= i@21@00)]
(assert (not (<= 0 i@21@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 22 | 0 <= i@21@00]
(assert (<= 0 i@21@00))
; [eval] i < j
(push) ; 5
; [then-branch: 23 | !(i@21@00 < j@22@00) | live]
; [else-branch: 23 | i@21@00 < j@22@00 | live]
(push) ; 6
; [then-branch: 23 | !(i@21@00 < j@22@00)]
(assert (not (< i@21@00 j@22@00)))
(pop) ; 6
(push) ; 6
; [else-branch: 23 | i@21@00 < j@22@00]
(assert (< i@21@00 j@22@00))
; [eval] j < |result|
; [eval] |result|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (< i@21@00 j@22@00) (not (< i@21@00 j@22@00))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@21@00)
  (and (<= 0 i@21@00) (or (< i@21@00 j@22@00) (not (< i@21@00 j@22@00))))))
(assert (or (<= 0 i@21@00) (not (<= 0 i@21@00))))
(push) ; 3
; [then-branch: 24 | 0 <= i@21@00 && i@21@00 < j@22@00 && j@22@00 < |result@2@00| | live]
; [else-branch: 24 | !(0 <= i@21@00 && i@21@00 < j@22@00 && j@22@00 < |result@2@00|) | live]
(push) ; 4
; [then-branch: 24 | 0 <= i@21@00 && i@21@00 < j@22@00 && j@22@00 < |result@2@00|]
(assert (and
  (<= 0 i@21@00)
  (and (< i@21@00 j@22@00) (< j@22@00 (Seq_length result@2@00)))))
; [eval] result[i] <= result[j]
; [eval] result[i]
(push) ; 5
(assert (not (>= i@21@00 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@21@00 (Seq_length result@2@00))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] result[j]
(push) ; 5
(assert (not (>= j@22@00 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 24 | !(0 <= i@21@00 && i@21@00 < j@22@00 && j@22@00 < |result@2@00|)]
(assert (not
  (and
    (<= 0 i@21@00)
    (and (< i@21@00 j@22@00) (< j@22@00 (Seq_length result@2@00))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@21@00)
    (and (< i@21@00 j@22@00) (< j@22@00 (Seq_length result@2@00))))
  (and (<= 0 i@21@00) (< i@21@00 j@22@00) (< j@22@00 (Seq_length result@2@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@21@00)
      (and (< i@21@00 j@22@00) (< j@22@00 (Seq_length result@2@00)))))
  (and
    (<= 0 i@21@00)
    (and (< i@21@00 j@22@00) (< j@22@00 (Seq_length result@2@00))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@21@00 Int) (j@22@00 Int)) (!
  (and
    (=>
      (<= 0 i@21@00)
      (and (<= 0 i@21@00) (or (< i@21@00 j@22@00) (not (< i@21@00 j@22@00)))))
    (or (<= 0 i@21@00) (not (<= 0 i@21@00)))
    (=>
      (and
        (<= 0 i@21@00)
        (and (< i@21@00 j@22@00) (< j@22@00 (Seq_length result@2@00))))
      (and
        (<= 0 i@21@00)
        (< i@21@00 j@22@00)
        (< j@22@00 (Seq_length result@2@00))))
    (or
      (not
        (and
          (<= 0 i@21@00)
          (and (< i@21@00 j@22@00) (< j@22@00 (Seq_length result@2@00)))))
      (and
        (<= 0 i@21@00)
        (and (< i@21@00 j@22@00) (< j@22@00 (Seq_length result@2@00))))))
  :pattern ((Seq_index result@2@00 i@21@00) (Seq_index result@2@00 j@22@00))
  :qid |prog./silicon/silver/src/test/resources/examples/vmcai2016/linked-list-predicates-with-wands.vpr@25@12@25@95-aux|)))
(push) ; 2
(assert (not (forall ((i@21@00 Int) (j@22@00 Int)) (!
  (=>
    (and
      (<= 0 i@21@00)
      (and (< i@21@00 j@22@00) (< j@22@00 (Seq_length result@2@00))))
    (<= (Seq_index result@2@00 i@21@00) (Seq_index result@2@00 j@22@00)))
  :pattern ((Seq_index result@2@00 i@21@00) (Seq_index result@2@00 j@22@00))
  :qid |prog./silicon/silver/src/test/resources/examples/vmcai2016/linked-list-predicates-with-wands.vpr@25@12@25@95|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@21@00 Int) (j@22@00 Int)) (!
  (=>
    (and
      (<= 0 i@21@00)
      (and (< i@21@00 j@22@00) (< j@22@00 (Seq_length result@2@00))))
    (<= (Seq_index result@2@00 i@21@00) (Seq_index result@2@00 j@22@00)))
  :pattern ((Seq_index result@2@00 i@21@00) (Seq_index result@2@00 j@22@00))
  :qid |prog./silicon/silver/src/test/resources/examples/vmcai2016/linked-list-predicates-with-wands.vpr@25@12@25@95|)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@0@00 $Ref) (end@1@00 $Ref)) (!
  (=>
    (contentNodes%precondition s@$ this@0@00 end@1@00)
    (=
      (contentNodes s@$ this@0@00 end@1@00)
      (ite
        (= this@0@00 end@1@00)
        (as Seq_empty  Seq<Int>)
        (Seq_append
          (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first s@$)))
          (contentNodes%limited ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)))))
  :pattern ((contentNodes s@$ this@0@00 end@1@00))
  :pattern ((contentNodes%stateless this@0@00 end@1@00) (lseg%trigger s@$ this@0@00 end@1@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref) (end@1@00 $Ref)) (!
  (=>
    (contentNodes%precondition s@$ this@0@00 end@1@00)
    (ite
      (= this@0@00 end@1@00)
      true
      (contentNodes%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@1@00)))
  :pattern ((contentNodes s@$ this@0@00 end@1@00))
  :qid |quant-u-15|)))
; ---------- FUNCTION lengthNodes----------
(declare-fun this@3@00 () $Ref)
(declare-fun end@4@00 () $Ref)
(declare-fun result@5@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const $t@23@00 $Snap)
(assert (= $t@23@00 $Snap.unit))
; [eval] result == |contentNodes(this, end)|
; [eval] |contentNodes(this, end)|
; [eval] contentNodes(this, end)
(push) ; 2
(assert (contentNodes%precondition s@$ this@3@00 end@4@00))
(pop) ; 2
; Joined path conditions
(assert (contentNodes%precondition s@$ this@3@00 end@4@00))
(assert (= result@5@00 (Seq_length (contentNodes s@$ this@3@00 end@4@00))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@3@00 $Ref) (end@4@00 $Ref)) (!
  (=
    (lengthNodes%limited s@$ this@3@00 end@4@00)
    (lengthNodes s@$ this@3@00 end@4@00))
  :pattern ((lengthNodes s@$ this@3@00 end@4@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (this@3@00 $Ref) (end@4@00 $Ref)) (!
  (lengthNodes%stateless this@3@00 end@4@00)
  :pattern ((lengthNodes%limited s@$ this@3@00 end@4@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (this@3@00 $Ref) (end@4@00 $Ref)) (!
  (let ((result@5@00 (lengthNodes%limited s@$ this@3@00 end@4@00))) (=>
    (lengthNodes%precondition s@$ this@3@00 end@4@00)
    (= result@5@00 (Seq_length (contentNodes s@$ this@3@00 end@4@00)))))
  :pattern ((lengthNodes%limited s@$ this@3@00 end@4@00))
  :qid |quant-u-16|)))
(assert (forall ((s@$ $Snap) (this@3@00 $Ref) (end@4@00 $Ref)) (!
  (let ((result@5@00 (lengthNodes%limited s@$ this@3@00 end@4@00))) (=>
    (lengthNodes%precondition s@$ this@3@00 end@4@00)
    (contentNodes%precondition s@$ this@3@00 end@4@00)))
  :pattern ((lengthNodes%limited s@$ this@3@00 end@4@00))
  :qid |quant-u-17|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(lseg(this, end), write) in (this == end ? 0 : 1 + lengthNodes(this.next, end)))
(set-option :timeout 0)
(push) ; 2
(assert (lseg%trigger s@$ this@3@00 end@4@00))
; [eval] this != end
(push) ; 3
(set-option :timeout 10)
(assert (not (= this@3@00 end@4@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= this@3@00 end@4@00))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 25 | this@3@00 != end@4@00 | live]
; [else-branch: 25 | this@3@00 == end@4@00 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 25 | this@3@00 != end@4@00]
(assert (not (= this@3@00 end@4@00)))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= this@3@00 $Ref.null)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] (unfolding acc(lseg(this.next, end), write) in this.next != end ==> this.data <= this.next.data)
(push) ; 4
(assert (lseg%trigger ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@4@00))
; [eval] this != end
(push) ; 5
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@4@00)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@4@00))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 26 | First:(Second:(s@$)) != end@4@00 | live]
; [else-branch: 26 | First:(Second:(s@$)) == end@4@00 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 26 | First:(Second:(s@$)) != end@4@00]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@4@00)))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))))
(push) ; 6
(set-option :timeout 10)
(assert (not (= this@3@00 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= this@3@00 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
  $Snap.unit))
; [eval] (unfolding acc(lseg(this.next, end), write) in this.next != end ==> this.data <= this.next.data)
(declare-fun recunf@24@00 ($Snap $Ref $Ref) Bool)
(assert (recunf@24@00 s@$ this@3@00 end@4@00))
; [eval] this.next != end ==> this.data <= this.next.data
; [eval] this.next != end
(set-option :timeout 0)
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@4@00)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 27 | First:(Second:(s@$)) != end@4@00 | live]
; [else-branch: 27 | First:(Second:(s@$)) == end@4@00 | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 27 | First:(Second:(s@$)) != end@4@00]
; [eval] this.data <= this.next.data
(pop) ; 7
(pop) ; 6
; Joined path conditions
(pop) ; 5
(push) ; 5
; [else-branch: 26 | First:(Second:(s@$)) == end@4@00]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@4@00))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] this.next != end ==> this.data <= this.next.data
; [eval] this.next != end
(push) ; 6
; [then-branch: 28 | First:(Second:(s@$)) != end@4@00 | dead]
; [else-branch: 28 | First:(Second:(s@$)) == end@4@00 | live]
(push) ; 7
; [else-branch: 28 | First:(Second:(s@$)) == end@4@00]
(pop) ; 7
(pop) ; 6
; Joined path conditions
(pop) ; 5
(pop) ; 4
(declare-fun joined_unfolding@25@00 ($Snap $Ref $Ref) Bool)
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@4@00))
  (=
    (joined_unfolding@25@00 s@$ this@3@00 end@4@00)
    (=>
      (not
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@4@00))
      (<=
        ($SortWrappers.$SnapToInt ($Snap.first s@$))
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@4@00)
  (= (joined_unfolding@25@00 s@$ this@3@00 end@4@00) true)))
; Joined path conditions
(assert (lseg%trigger ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@4@00))
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@4@00))
  (and
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@4@00))
    (=
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.combine
        ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))
        ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
    (=
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
        ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))))
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
      $Snap.unit)
    (recunf@24@00 s@$ this@3@00 end@4@00))))
; Joined path conditions
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@4@00)
  (and
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@4@00)
    (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))))
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@4@00)
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@4@00))))
(assert (joined_unfolding@25@00 s@$ this@3@00 end@4@00))
; [eval] (this == end ? 0 : 1 + lengthNodes(this.next, end))
; [eval] this == end
(push) ; 4
; [then-branch: 29 | this@3@00 == end@4@00 | dead]
; [else-branch: 29 | this@3@00 != end@4@00 | live]
(push) ; 5
; [else-branch: 29 | this@3@00 != end@4@00]
; [eval] 1 + lengthNodes(this.next, end)
; [eval] lengthNodes(this.next, end)
(push) ; 6
(assert (lengthNodes%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@4@00))
(pop) ; 6
; Joined path conditions
(assert (lengthNodes%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@4@00))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (not (= this@3@00 end@4@00))
  (lengthNodes%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@4@00)))
(pop) ; 3
(push) ; 3
; [else-branch: 25 | this@3@00 == end@4@00]
(assert (= this@3@00 end@4@00))
(assert (= s@$ $Snap.unit))
; [eval] (this == end ? 0 : 1 + lengthNodes(this.next, end))
; [eval] this == end
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= this@3@00 end@4@00))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 30 | this@3@00 == end@4@00 | live]
; [else-branch: 30 | this@3@00 != end@4@00 | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 30 | this@3@00 == end@4@00]
(pop) ; 5
(pop) ; 4
; Joined path conditions
(pop) ; 3
(pop) ; 2
(declare-fun joined_unfolding@26@00 ($Snap $Ref $Ref) Int)
(assert (=>
  (not (= this@3@00 end@4@00))
  (=
    (joined_unfolding@26@00 s@$ this@3@00 end@4@00)
    (+
      1
      (lengthNodes ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@4@00)))))
(assert (=> (= this@3@00 end@4@00) (= (joined_unfolding@26@00 s@$ this@3@00 end@4@00) 0)))
; Joined path conditions
(assert (lseg%trigger s@$ this@3@00 end@4@00))
(assert (=>
  (not (= this@3@00 end@4@00))
  (and
    (not (= this@3@00 end@4@00))
    (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
    (not (= this@3@00 $Ref.null))
    (=
      ($Snap.second s@$)
      ($Snap.combine
        ($Snap.first ($Snap.second s@$))
        ($Snap.second ($Snap.second s@$))))
    (=
      ($Snap.second ($Snap.second s@$))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second s@$)))
        ($Snap.second ($Snap.second ($Snap.second s@$)))))
    (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit)
    (=>
      (not
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@4@00))
      (=
        (joined_unfolding@25@00 s@$ this@3@00 end@4@00)
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              end@4@00))
          (<=
            ($SortWrappers.$SnapToInt ($Snap.first s@$))
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
    (=>
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@4@00)
      (= (joined_unfolding@25@00 s@$ this@3@00 end@4@00) true))
    (lseg%trigger ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@4@00)
    (=>
      (not
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@4@00))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            end@4@00))
        (=
          ($Snap.first ($Snap.second ($Snap.second s@$)))
          ($Snap.combine
            ($Snap.first ($Snap.first ($Snap.second ($Snap.second s@$))))
            ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            $Ref.null))
        (=
          ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
            ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))))
        (=
          ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$)))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second s@$))))))
          $Snap.unit)
        (recunf@24@00 s@$ this@3@00 end@4@00)))
    (=>
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@4@00)
      (and
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@4@00)
        (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit)))
    (or
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@4@00)
      (not
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@4@00)))
    (joined_unfolding@25@00 s@$ this@3@00 end@4@00)
    (=>
      (not (= this@3@00 end@4@00))
      (lengthNodes%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@4@00)))))
; Joined path conditions
(assert (=> (= this@3@00 end@4@00) (and (= this@3@00 end@4@00) (= s@$ $Snap.unit))))
(assert (or (= this@3@00 end@4@00) (not (= this@3@00 end@4@00))))
(assert (= result@5@00 (joined_unfolding@26@00 s@$ this@3@00 end@4@00)))
; [eval] result == |contentNodes(this, end)|
; [eval] |contentNodes(this, end)|
; [eval] contentNodes(this, end)
(push) ; 2
(assert (contentNodes%precondition s@$ this@3@00 end@4@00))
(pop) ; 2
; Joined path conditions
(assert (contentNodes%precondition s@$ this@3@00 end@4@00))
(push) ; 2
(assert (not (= result@5@00 (Seq_length (contentNodes s@$ this@3@00 end@4@00)))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (= result@5@00 (Seq_length (contentNodes s@$ this@3@00 end@4@00))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@3@00 $Ref) (end@4@00 $Ref)) (!
  (=>
    (lengthNodes%precondition s@$ this@3@00 end@4@00)
    (=
      (lengthNodes s@$ this@3@00 end@4@00)
      (ite
        (= this@3@00 end@4@00)
        0
        (+
          1
          (lengthNodes%limited ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@4@00)))))
  :pattern ((lengthNodes s@$ this@3@00 end@4@00))
  :pattern ((lengthNodes%stateless this@3@00 end@4@00) (lseg%trigger s@$ this@3@00 end@4@00))
  :qid |quant-u-18|)))
(assert (forall ((s@$ $Snap) (this@3@00 $Ref) (end@4@00 $Ref)) (!
  (=>
    (lengthNodes%precondition s@$ this@3@00 end@4@00)
    (ite
      (= this@3@00 end@4@00)
      true
      (lengthNodes%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) end@4@00)))
  :pattern ((lengthNodes s@$ this@3@00 end@4@00))
  :qid |quant-u-19|)))
; ---------- FUNCTION content----------
(declare-fun this@6@00 () $Ref)
(declare-fun result@7@00 () Seq<Int>)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const $t@27@00 $Snap)
(assert (= $t@27@00 $Snap.unit))
; [eval] (forall i: Int, j: Int :: { result[i], result[j] } 0 <= i && (i < j && j < |result|) ==> result[i] <= result[j])
(declare-const i@28@00 Int)
(declare-const j@29@00 Int)
(push) ; 2
; [eval] 0 <= i && (i < j && j < |result|) ==> result[i] <= result[j]
; [eval] 0 <= i && (i < j && j < |result|)
; [eval] 0 <= i
(push) ; 3
; [then-branch: 31 | !(0 <= i@28@00) | live]
; [else-branch: 31 | 0 <= i@28@00 | live]
(push) ; 4
; [then-branch: 31 | !(0 <= i@28@00)]
(assert (not (<= 0 i@28@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 31 | 0 <= i@28@00]
(assert (<= 0 i@28@00))
; [eval] i < j
(push) ; 5
; [then-branch: 32 | !(i@28@00 < j@29@00) | live]
; [else-branch: 32 | i@28@00 < j@29@00 | live]
(push) ; 6
; [then-branch: 32 | !(i@28@00 < j@29@00)]
(assert (not (< i@28@00 j@29@00)))
(pop) ; 6
(push) ; 6
; [else-branch: 32 | i@28@00 < j@29@00]
(assert (< i@28@00 j@29@00))
; [eval] j < |result|
; [eval] |result|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (< i@28@00 j@29@00) (not (< i@28@00 j@29@00))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@28@00)
  (and (<= 0 i@28@00) (or (< i@28@00 j@29@00) (not (< i@28@00 j@29@00))))))
(assert (or (<= 0 i@28@00) (not (<= 0 i@28@00))))
(push) ; 3
; [then-branch: 33 | 0 <= i@28@00 && i@28@00 < j@29@00 && j@29@00 < |result@7@00| | live]
; [else-branch: 33 | !(0 <= i@28@00 && i@28@00 < j@29@00 && j@29@00 < |result@7@00|) | live]
(push) ; 4
; [then-branch: 33 | 0 <= i@28@00 && i@28@00 < j@29@00 && j@29@00 < |result@7@00|]
(assert (and
  (<= 0 i@28@00)
  (and (< i@28@00 j@29@00) (< j@29@00 (Seq_length result@7@00)))))
; [eval] result[i] <= result[j]
; [eval] result[i]
(push) ; 5
(assert (not (>= i@28@00 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@28@00 (Seq_length result@7@00))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] result[j]
(push) ; 5
(assert (not (>= j@29@00 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 33 | !(0 <= i@28@00 && i@28@00 < j@29@00 && j@29@00 < |result@7@00|)]
(assert (not
  (and
    (<= 0 i@28@00)
    (and (< i@28@00 j@29@00) (< j@29@00 (Seq_length result@7@00))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@28@00)
    (and (< i@28@00 j@29@00) (< j@29@00 (Seq_length result@7@00))))
  (and (<= 0 i@28@00) (< i@28@00 j@29@00) (< j@29@00 (Seq_length result@7@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@28@00)
      (and (< i@28@00 j@29@00) (< j@29@00 (Seq_length result@7@00)))))
  (and
    (<= 0 i@28@00)
    (and (< i@28@00 j@29@00) (< j@29@00 (Seq_length result@7@00))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@28@00 Int) (j@29@00 Int)) (!
  (and
    (=>
      (<= 0 i@28@00)
      (and (<= 0 i@28@00) (or (< i@28@00 j@29@00) (not (< i@28@00 j@29@00)))))
    (or (<= 0 i@28@00) (not (<= 0 i@28@00)))
    (=>
      (and
        (<= 0 i@28@00)
        (and (< i@28@00 j@29@00) (< j@29@00 (Seq_length result@7@00))))
      (and
        (<= 0 i@28@00)
        (< i@28@00 j@29@00)
        (< j@29@00 (Seq_length result@7@00))))
    (or
      (not
        (and
          (<= 0 i@28@00)
          (and (< i@28@00 j@29@00) (< j@29@00 (Seq_length result@7@00)))))
      (and
        (<= 0 i@28@00)
        (and (< i@28@00 j@29@00) (< j@29@00 (Seq_length result@7@00))))))
  :pattern ((Seq_index result@7@00 i@28@00) (Seq_index result@7@00 j@29@00))
  :qid |prog./silicon/silver/src/test/resources/examples/vmcai2016/linked-list-predicates-with-wands.vpr@56@12@56@95-aux|)))
(assert (forall ((i@28@00 Int) (j@29@00 Int)) (!
  (=>
    (and
      (<= 0 i@28@00)
      (and (< i@28@00 j@29@00) (< j@29@00 (Seq_length result@7@00))))
    (<= (Seq_index result@7@00 i@28@00) (Seq_index result@7@00 j@29@00)))
  :pattern ((Seq_index result@7@00 i@28@00) (Seq_index result@7@00 j@29@00))
  :qid |prog./silicon/silver/src/test/resources/examples/vmcai2016/linked-list-predicates-with-wands.vpr@56@12@56@95|)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@6@00 $Ref)) (!
  (= (content%limited s@$ this@6@00) (content s@$ this@6@00))
  :pattern ((content s@$ this@6@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (this@6@00 $Ref)) (!
  (content%stateless this@6@00)
  :pattern ((content%limited s@$ this@6@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (this@6@00 $Ref)) (!
  (let ((result@7@00 (content%limited s@$ this@6@00))) (=>
    (content%precondition s@$ this@6@00)
    (forall ((i Int) (j Int)) (!
      (=>
        (and (<= 0 i) (and (< i j) (< j (Seq_length result@7@00))))
        (<= (Seq_index result@7@00 i) (Seq_index result@7@00 j)))
      :pattern ((Seq_index result@7@00 i) (Seq_index result@7@00 j))
      ))))
  :pattern ((content%limited s@$ this@6@00))
  :qid |quant-u-20|)))
(assert (forall ((s@$ $Snap) (this@6@00 $Ref)) (!
  (let ((result@7@00 (content%limited s@$ this@6@00))) true)
  :pattern ((content%limited s@$ this@6@00))
  :qid |quant-u-21|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(List(this), write) in contentNodes(this.head, null))
(set-option :timeout 0)
(push) ; 2
(assert (List%trigger s@$ this@6@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= this@6@00 $Ref.null)))
; [eval] contentNodes(this.head, null)
(push) ; 3
(assert (contentNodes%precondition ($Snap.second s@$) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null))
(pop) ; 3
; Joined path conditions
(assert (contentNodes%precondition ($Snap.second s@$) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null))
(pop) ; 2
; Joined path conditions
(assert (and
  (List%trigger s@$ this@6@00)
  (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
  (not (= this@6@00 $Ref.null))
  (contentNodes%precondition ($Snap.second s@$) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null)))
(assert (=
  result@7@00
  (contentNodes ($Snap.second s@$) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null)))
; [eval] (forall i: Int, j: Int :: { result[i], result[j] } 0 <= i && (i < j && j < |result|) ==> result[i] <= result[j])
(declare-const i@30@00 Int)
(declare-const j@31@00 Int)
(push) ; 2
; [eval] 0 <= i && (i < j && j < |result|) ==> result[i] <= result[j]
; [eval] 0 <= i && (i < j && j < |result|)
; [eval] 0 <= i
(push) ; 3
; [then-branch: 34 | !(0 <= i@30@00) | live]
; [else-branch: 34 | 0 <= i@30@00 | live]
(push) ; 4
; [then-branch: 34 | !(0 <= i@30@00)]
(assert (not (<= 0 i@30@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 34 | 0 <= i@30@00]
(assert (<= 0 i@30@00))
; [eval] i < j
(push) ; 5
; [then-branch: 35 | !(i@30@00 < j@31@00) | live]
; [else-branch: 35 | i@30@00 < j@31@00 | live]
(push) ; 6
; [then-branch: 35 | !(i@30@00 < j@31@00)]
(assert (not (< i@30@00 j@31@00)))
(pop) ; 6
(push) ; 6
; [else-branch: 35 | i@30@00 < j@31@00]
(assert (< i@30@00 j@31@00))
; [eval] j < |result|
; [eval] |result|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (< i@30@00 j@31@00) (not (< i@30@00 j@31@00))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@30@00)
  (and (<= 0 i@30@00) (or (< i@30@00 j@31@00) (not (< i@30@00 j@31@00))))))
(assert (or (<= 0 i@30@00) (not (<= 0 i@30@00))))
(push) ; 3
; [then-branch: 36 | 0 <= i@30@00 && i@30@00 < j@31@00 && j@31@00 < |result@7@00| | live]
; [else-branch: 36 | !(0 <= i@30@00 && i@30@00 < j@31@00 && j@31@00 < |result@7@00|) | live]
(push) ; 4
; [then-branch: 36 | 0 <= i@30@00 && i@30@00 < j@31@00 && j@31@00 < |result@7@00|]
(assert (and
  (<= 0 i@30@00)
  (and (< i@30@00 j@31@00) (< j@31@00 (Seq_length result@7@00)))))
; [eval] result[i] <= result[j]
; [eval] result[i]
(push) ; 5
(assert (not (>= i@30@00 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@30@00 (Seq_length result@7@00))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] result[j]
(push) ; 5
(assert (not (>= j@31@00 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 36 | !(0 <= i@30@00 && i@30@00 < j@31@00 && j@31@00 < |result@7@00|)]
(assert (not
  (and
    (<= 0 i@30@00)
    (and (< i@30@00 j@31@00) (< j@31@00 (Seq_length result@7@00))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@30@00)
    (and (< i@30@00 j@31@00) (< j@31@00 (Seq_length result@7@00))))
  (and (<= 0 i@30@00) (< i@30@00 j@31@00) (< j@31@00 (Seq_length result@7@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@30@00)
      (and (< i@30@00 j@31@00) (< j@31@00 (Seq_length result@7@00)))))
  (and
    (<= 0 i@30@00)
    (and (< i@30@00 j@31@00) (< j@31@00 (Seq_length result@7@00))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@30@00 Int) (j@31@00 Int)) (!
  (and
    (=>
      (<= 0 i@30@00)
      (and (<= 0 i@30@00) (or (< i@30@00 j@31@00) (not (< i@30@00 j@31@00)))))
    (or (<= 0 i@30@00) (not (<= 0 i@30@00)))
    (=>
      (and
        (<= 0 i@30@00)
        (and (< i@30@00 j@31@00) (< j@31@00 (Seq_length result@7@00))))
      (and
        (<= 0 i@30@00)
        (< i@30@00 j@31@00)
        (< j@31@00 (Seq_length result@7@00))))
    (or
      (not
        (and
          (<= 0 i@30@00)
          (and (< i@30@00 j@31@00) (< j@31@00 (Seq_length result@7@00)))))
      (and
        (<= 0 i@30@00)
        (and (< i@30@00 j@31@00) (< j@31@00 (Seq_length result@7@00))))))
  :pattern ((Seq_index result@7@00 i@30@00) (Seq_index result@7@00 j@31@00))
  :qid |prog./silicon/silver/src/test/resources/examples/vmcai2016/linked-list-predicates-with-wands.vpr@56@12@56@95-aux|)))
(push) ; 2
(assert (not (forall ((i@30@00 Int) (j@31@00 Int)) (!
  (=>
    (and
      (<= 0 i@30@00)
      (and (< i@30@00 j@31@00) (< j@31@00 (Seq_length result@7@00))))
    (<= (Seq_index result@7@00 i@30@00) (Seq_index result@7@00 j@31@00)))
  :pattern ((Seq_index result@7@00 i@30@00) (Seq_index result@7@00 j@31@00))
  :qid |prog./silicon/silver/src/test/resources/examples/vmcai2016/linked-list-predicates-with-wands.vpr@56@12@56@95|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@30@00 Int) (j@31@00 Int)) (!
  (=>
    (and
      (<= 0 i@30@00)
      (and (< i@30@00 j@31@00) (< j@31@00 (Seq_length result@7@00))))
    (<= (Seq_index result@7@00 i@30@00) (Seq_index result@7@00 j@31@00)))
  :pattern ((Seq_index result@7@00 i@30@00) (Seq_index result@7@00 j@31@00))
  :qid |prog./silicon/silver/src/test/resources/examples/vmcai2016/linked-list-predicates-with-wands.vpr@56@12@56@95|)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@6@00 $Ref)) (!
  (=>
    (content%precondition s@$ this@6@00)
    (=
      (content s@$ this@6@00)
      (contentNodes ($Snap.second s@$) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null)))
  :pattern ((content s@$ this@6@00))
  :pattern ((content%stateless this@6@00) (List%trigger s@$ this@6@00))
  :qid |quant-u-22|)))
(assert (forall ((s@$ $Snap) (this@6@00 $Ref)) (!
  (=>
    (content%precondition s@$ this@6@00)
    (contentNodes%precondition ($Snap.second s@$) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null))
  :pattern ((content s@$ this@6@00))
  :qid |quant-u-23|)))
; ---------- FUNCTION length----------
(declare-fun this@8@00 () $Ref)
(declare-fun result@9@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const $t@32@00 $Snap)
(assert (= $t@32@00 $Snap.unit))
; [eval] result == |content(this)|
; [eval] |content(this)|
; [eval] content(this)
(push) ; 2
(assert (content%precondition s@$ this@8@00))
(pop) ; 2
; Joined path conditions
(assert (content%precondition s@$ this@8@00))
(assert (= result@9@00 (Seq_length (content s@$ this@8@00))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@8@00 $Ref)) (!
  (= (length%limited s@$ this@8@00) (length s@$ this@8@00))
  :pattern ((length s@$ this@8@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (this@8@00 $Ref)) (!
  (length%stateless this@8@00)
  :pattern ((length%limited s@$ this@8@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (this@8@00 $Ref)) (!
  (let ((result@9@00 (length%limited s@$ this@8@00))) (=>
    (length%precondition s@$ this@8@00)
    (= result@9@00 (Seq_length (content s@$ this@8@00)))))
  :pattern ((length%limited s@$ this@8@00))
  :qid |quant-u-24|)))
(assert (forall ((s@$ $Snap) (this@8@00 $Ref)) (!
  (let ((result@9@00 (length%limited s@$ this@8@00))) (=>
    (length%precondition s@$ this@8@00)
    (content%precondition s@$ this@8@00)))
  :pattern ((length%limited s@$ this@8@00))
  :qid |quant-u-25|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(List(this), write) in lengthNodes(this.head, null))
(set-option :timeout 0)
(push) ; 2
(assert (List%trigger s@$ this@8@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= this@8@00 $Ref.null)))
; [eval] lengthNodes(this.head, null)
(push) ; 3
(assert (lengthNodes%precondition ($Snap.second s@$) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null))
(pop) ; 3
; Joined path conditions
(assert (lengthNodes%precondition ($Snap.second s@$) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null))
(pop) ; 2
; Joined path conditions
(assert (and
  (List%trigger s@$ this@8@00)
  (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
  (not (= this@8@00 $Ref.null))
  (lengthNodes%precondition ($Snap.second s@$) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null)))
(assert (=
  result@9@00
  (lengthNodes ($Snap.second s@$) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null)))
; [eval] result == |content(this)|
; [eval] |content(this)|
; [eval] content(this)
(push) ; 2
(assert (content%precondition s@$ this@8@00))
(pop) ; 2
; Joined path conditions
(assert (content%precondition s@$ this@8@00))
(push) ; 2
(assert (not (= result@9@00 (Seq_length (content s@$ this@8@00)))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (= result@9@00 (Seq_length (content s@$ this@8@00))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@8@00 $Ref)) (!
  (=>
    (length%precondition s@$ this@8@00)
    (=
      (length s@$ this@8@00)
      (lengthNodes ($Snap.second s@$) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null)))
  :pattern ((length s@$ this@8@00))
  :pattern ((length%stateless this@8@00) (List%trigger s@$ this@8@00))
  :qid |quant-u-26|)))
(assert (forall ((s@$ $Snap) (this@8@00 $Ref)) (!
  (=>
    (length%precondition s@$ this@8@00)
    (lengthNodes%precondition ($Snap.second s@$) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null))
  :pattern ((length s@$ this@8@00))
  :qid |quant-u-27|)))
; ---------- FUNCTION peek----------
(declare-fun this@10@00 () $Ref)
(declare-fun result@11@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.second s@$) $Snap.unit))
; [eval] 0 < length(this)
; [eval] length(this)
(push) ; 2
(assert (length%precondition ($Snap.first s@$) this@10@00))
(pop) ; 2
; Joined path conditions
(assert (length%precondition ($Snap.first s@$) this@10@00))
(assert (< 0 (length ($Snap.first s@$) this@10@00)))
(declare-const $t@33@00 $Snap)
(assert (= $t@33@00 $Snap.unit))
; [eval] result == content(this)[0]
; [eval] content(this)[0]
; [eval] content(this)
(push) ; 2
(assert (content%precondition ($Snap.first s@$) this@10@00))
(pop) ; 2
; Joined path conditions
(assert (content%precondition ($Snap.first s@$) this@10@00))
(push) ; 2
(assert (not (< 0 (Seq_length (content ($Snap.first s@$) this@10@00)))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (= result@11@00 (Seq_index (content ($Snap.first s@$) this@10@00) 0)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@10@00 $Ref)) (!
  (= (peek%limited s@$ this@10@00) (peek s@$ this@10@00))
  :pattern ((peek s@$ this@10@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (this@10@00 $Ref)) (!
  (peek%stateless this@10@00)
  :pattern ((peek%limited s@$ this@10@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (this@10@00 $Ref)) (!
  (let ((result@11@00 (peek%limited s@$ this@10@00))) (=>
    (peek%precondition s@$ this@10@00)
    (= result@11@00 (Seq_index (content ($Snap.first s@$) this@10@00) 0))))
  :pattern ((peek%limited s@$ this@10@00))
  :qid |quant-u-28|)))
(assert (forall ((s@$ $Snap) (this@10@00 $Ref)) (!
  (let ((result@11@00 (peek%limited s@$ this@10@00))) (=>
    (peek%precondition s@$ this@10@00)
    (content%precondition ($Snap.first s@$) this@10@00)))
  :pattern ((peek%limited s@$ this@10@00))
  :qid |quant-u-29|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.second s@$) $Snap.unit))
(assert (length%precondition ($Snap.first s@$) this@10@00))
(assert (< 0 (length ($Snap.first s@$) this@10@00)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(List(this), write) in (unfolding acc(lseg(this.head, null), write) in this.head.data))
(set-option :timeout 0)
(push) ; 2
(assert (List%trigger ($Snap.first s@$) this@10@00))
(assert (=
  ($Snap.first s@$)
  ($Snap.combine
    ($Snap.first ($Snap.first s@$))
    ($Snap.second ($Snap.first s@$)))))
(assert (not (= this@10@00 $Ref.null)))
; [eval] (unfolding acc(lseg(this.head, null), write) in this.head.data)
(push) ; 3
(assert (lseg%trigger ($Snap.second ($Snap.first s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
; [eval] this != end
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 37 | First:(First:(s@$)) != Null | live]
; [else-branch: 37 | First:(First:(s@$)) == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 37 | First:(First:(s@$)) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first s@$)))
    ($Snap.second ($Snap.second ($Snap.first s@$))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))
  $Snap.unit))
; [eval] (unfolding acc(lseg(this.next, end), write) in this.next != end ==> this.data <= this.next.data)
(push) ; 5
(assert (lseg%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))) $Ref.null))
; [eval] this != end
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 38 | First:(Second:(Second:(First:(s@$)))) != Null | live]
; [else-branch: 38 | First:(Second:(Second:(First:(s@$)))) == Null | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 38 | First:(Second:(Second:(First:(s@$)))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))))
    $Ref.null)))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))))))
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))))))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))))
  $Snap.unit))
; [eval] (unfolding acc(lseg(this.next, end), write) in this.next != end ==> this.data <= this.next.data)
(declare-fun recunf@34@00 ($Snap $Ref) Bool)
(assert (recunf@34@00 s@$ this@10@00))
; [eval] this.next != end ==> this.data <= this.next.data
; [eval] this.next != end
(set-option :timeout 0)
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 39 | First:(Second:(Second:(First:(s@$)))) != Null | live]
; [else-branch: 39 | First:(Second:(Second:(First:(s@$)))) == Null | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 39 | First:(Second:(Second:(First:(s@$)))) != Null]
; [eval] this.data <= this.next.data
(pop) ; 8
(pop) ; 7
; Joined path conditions
(pop) ; 6
(push) ; 6
; [else-branch: 38 | First:(Second:(Second:(First:(s@$)))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))))
  $Ref.null))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))
  $Snap.unit))
; [eval] this.next != end ==> this.data <= this.next.data
; [eval] this.next != end
(push) ; 7
; [then-branch: 40 | First:(Second:(Second:(First:(s@$)))) != Null | dead]
; [else-branch: 40 | First:(Second:(Second:(First:(s@$)))) == Null | live]
(push) ; 8
; [else-branch: 40 | First:(Second:(Second:(First:(s@$)))) == Null]
(pop) ; 8
(pop) ; 7
; Joined path conditions
(pop) ; 6
(pop) ; 5
(declare-fun joined_unfolding@35@00 ($Snap $Ref) Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))))
      $Ref.null))
  (=
    (joined_unfolding@35@00 s@$ this@10@00)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))))
          $Ref.null))
      (<=
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))))
    $Ref.null)
  (= (joined_unfolding@35@00 s@$ this@10@00) true)))
; Joined path conditions
(assert (lseg%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))) $Ref.null))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))))
        $Ref.null))
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))
      ($Snap.combine
        ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))
        ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))))
    (=
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))))
        ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))))
      $Snap.unit)
    (recunf@34@00 s@$ this@10@00))))
; Joined path conditions
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))))
      $Ref.null)
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))
      $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))))
      $Ref.null))))
(assert (joined_unfolding@35@00 s@$ this@10@00))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (lseg%trigger ($Snap.second ($Snap.first s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
  (and
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
    (=
      ($Snap.second ($Snap.first s@$))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first s@$)))
        ($Snap.second ($Snap.second ($Snap.first s@$)))))
    (=
      ($Snap.second ($Snap.second ($Snap.first s@$)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))
      $Snap.unit)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))))
          $Ref.null))
      (=
        (joined_unfolding@35@00 s@$ this@10@00)
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))))
              $Ref.null))
          (<=
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))))))))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))))
        $Ref.null)
      (= (joined_unfolding@35@00 s@$ this@10@00) true))
    (lseg%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))) $Ref.null)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))))
            $Ref.null))
        (=
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))
          ($Snap.combine
            ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))
            ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))))
        (=
          ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))))
            ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))))))
        (=
          ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))))))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))))
          $Snap.unit)
        (recunf@34@00 s@$ this@10@00)))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))))
          $Ref.null)
        (=
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))
          $Snap.unit)))
    (or
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))))
        $Ref.null)
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))))
          $Ref.null)))
    (joined_unfolding@35@00 s@$ this@10@00))))
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)))
(pop) ; 2
; Joined path conditions
(assert (and
  (List%trigger ($Snap.first s@$) this@10@00)
  (=
    ($Snap.first s@$)
    ($Snap.combine
      ($Snap.first ($Snap.first s@$))
      ($Snap.second ($Snap.first s@$))))
  (not (= this@10@00 $Ref.null))
  (lseg%trigger ($Snap.second ($Snap.first s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null)
  (=>
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
    (and
      (not
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))
      (=
        ($Snap.second ($Snap.first s@$))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.first s@$)))
          ($Snap.second ($Snap.second ($Snap.first s@$)))))
      (=
        ($Snap.second ($Snap.second ($Snap.first s@$)))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))
      (=
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))))
      (=
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))
        $Snap.unit)
      (=>
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))))
            $Ref.null))
        (=
          (joined_unfolding@35@00 s@$ this@10@00)
          (=>
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))))
                $Ref.null))
            (<=
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))))))))
      (=>
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))))
          $Ref.null)
        (= (joined_unfolding@35@00 s@$ this@10@00) true))
      (lseg%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))) $Ref.null)
      (=>
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))))
            $Ref.null))
        (and
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))))
              $Ref.null))
          (=
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))
            ($Snap.combine
              ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))
              ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))))
          (=
            ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))))
              ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))))))
          (=
            ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))))
              ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))))))
          (=
            ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))))
            $Snap.unit)
          (recunf@34@00 s@$ this@10@00)))
      (=>
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))))
          $Ref.null)
        (and
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))))
            $Ref.null)
          (=
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))
            $Snap.unit)))
      (or
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))))
            $Ref.null)))
      (joined_unfolding@35@00 s@$ this@10@00)))
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first s@$))) $Ref.null))))
(assert (=
  result@11@00
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))))
; [eval] result == content(this)[0]
; [eval] content(this)[0]
; [eval] content(this)
(push) ; 2
(assert (content%precondition ($Snap.first s@$) this@10@00))
(pop) ; 2
; Joined path conditions
(assert (content%precondition ($Snap.first s@$) this@10@00))
(push) ; 2
(assert (not (< 0 (Seq_length (content ($Snap.first s@$) this@10@00)))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(assert (not (= result@11@00 (Seq_index (content ($Snap.first s@$) this@10@00) 0))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (= result@11@00 (Seq_index (content ($Snap.first s@$) this@10@00) 0)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@10@00 $Ref)) (!
  (=>
    (peek%precondition s@$ this@10@00)
    (=
      (peek s@$ this@10@00)
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))))
  :pattern ((peek s@$ this@10@00))
  :qid |quant-u-30|)))
(assert (forall ((s@$ $Snap) (this@10@00 $Ref)) (!
  true
  :pattern ((peek s@$ this@10@00))
  :qid |quant-u-31|)))
; ---------- lseg ----------
(declare-const this@36@00 $Ref)
(declare-const end@37@00 $Ref)
(push) ; 1
; [eval] this != end
(push) ; 2
(set-option :timeout 10)
(assert (not (= this@36@00 end@37@00)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (not (= this@36@00 end@37@00))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 41 | this@36@00 != end@37@00 | live]
; [else-branch: 41 | this@36@00 == end@37@00 | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 41 | this@36@00 != end@37@00]
(assert (not (= this@36@00 end@37@00)))
(declare-const $t@38@00 $Snap)
(assert (= $t@38@00 ($Snap.combine ($Snap.first $t@38@00) ($Snap.second $t@38@00))))
(assert (not (= this@36@00 $Ref.null)))
(assert (=
  ($Snap.second $t@38@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@38@00))
    ($Snap.second ($Snap.second $t@38@00)))))
(assert (=
  ($Snap.second ($Snap.second $t@38@00))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@38@00)))
    ($Snap.second ($Snap.second ($Snap.second $t@38@00))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@38@00))) $Snap.unit))
; [eval] (unfolding acc(lseg(this.next, end), write) in this.next != end ==> this.data <= this.next.data)
(push) ; 3
(assert (lseg%trigger ($Snap.first ($Snap.second ($Snap.second $t@38@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@38@00))) end@37@00))
; [eval] this != end
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@38@00))) end@37@00)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@38@00))) end@37@00))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 42 | First:(Second:($t@38@00)) != end@37@00 | live]
; [else-branch: 42 | First:(Second:($t@38@00)) == end@37@00 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 42 | First:(Second:($t@38@00)) != end@37@00]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@38@00))) end@37@00)))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second $t@38@00)))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@38@00))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00)))))))
(push) ; 5
(set-option :timeout 10)
(assert (not (= this@36@00 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@38@00))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@38@00))) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00)))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= this@36@00 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@38@00))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))
  $Snap.unit))
; [eval] (unfolding acc(lseg(this.next, end), write) in this.next != end ==> this.data <= this.next.data)
(set-option :timeout 0)
(push) ; 5
(assert (lseg%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00)))))) end@37@00))
; [eval] this != end
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))
  end@37@00)))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))
    end@37@00))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 43 | First:(Second:(First:(Second:(Second:($t@38@00))))) != end@37@00 | live]
; [else-branch: 43 | First:(Second:(First:(Second:(Second:($t@38@00))))) == end@37@00 | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 43 | First:(Second:(First:(Second:(Second:($t@38@00))))) != end@37@00]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))
    end@37@00)))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00)))))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))))))
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@38@00)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00)))))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  this@36@00
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00)))))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00)))))))))))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@38@00)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00)))))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  this@36@00
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00)))))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00)))))))))
  $Snap.unit))
; [eval] (unfolding acc(lseg(this.next, end), write) in this.next != end ==> this.data <= this.next.data)
(declare-const recunf@39@00 Bool)
(assert (as recunf@39@00  Bool))
; [eval] this.next != end ==> this.data <= this.next.data
; [eval] this.next != end
(set-option :timeout 0)
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))
  end@37@00)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 44 | First:(Second:(First:(Second:(Second:($t@38@00))))) != end@37@00 | live]
; [else-branch: 44 | First:(Second:(First:(Second:(Second:($t@38@00))))) == end@37@00 | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 44 | First:(Second:(First:(Second:(Second:($t@38@00))))) != end@37@00]
; [eval] this.data <= this.next.data
(pop) ; 8
(pop) ; 7
; Joined path conditions
(pop) ; 6
(push) ; 6
; [else-branch: 43 | First:(Second:(First:(Second:(Second:($t@38@00))))) == end@37@00]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))
  end@37@00))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))
  $Snap.unit))
; [eval] this.next != end ==> this.data <= this.next.data
; [eval] this.next != end
(push) ; 7
; [then-branch: 45 | First:(Second:(First:(Second:(Second:($t@38@00))))) != end@37@00 | dead]
; [else-branch: 45 | First:(Second:(First:(Second:(Second:($t@38@00))))) == end@37@00 | live]
(push) ; 8
; [else-branch: 45 | First:(Second:(First:(Second:(Second:($t@38@00))))) == end@37@00]
(pop) ; 8
(pop) ; 7
; Joined path conditions
(pop) ; 6
(pop) ; 5
(declare-const joined_unfolding@40@00 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))
      end@37@00))
  (=
    (as joined_unfolding@40@00  Bool)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))
          end@37@00))
      (<=
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@38@00)))))
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00)))))))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))
    end@37@00)
  (= (as joined_unfolding@40@00  Bool) true)))
; Joined path conditions
(assert (lseg%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00)))))) end@37@00))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))
      end@37@00))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))
        end@37@00))
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))
      ($Snap.combine
        ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00)))))))
        ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00)))))))))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00)))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))))
        ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00)))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00)))))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00)))))))))
      $Snap.unit)
    (as recunf@39@00  Bool))))
; Joined path conditions
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))
    end@37@00)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))
      end@37@00)
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))
      $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))
    end@37@00)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))
      end@37@00))))
(assert (as joined_unfolding@40@00  Bool))
; [eval] this.next != end ==> this.data <= this.next.data
; [eval] this.next != end
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@38@00))) end@37@00)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 46 | First:(Second:($t@38@00)) != end@37@00 | live]
; [else-branch: 46 | First:(Second:($t@38@00)) == end@37@00 | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 46 | First:(Second:($t@38@00)) != end@37@00]
; [eval] this.data <= this.next.data
(pop) ; 6
(pop) ; 5
; Joined path conditions
(pop) ; 4
(push) ; 4
; [else-branch: 42 | First:(Second:($t@38@00)) == end@37@00]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@38@00))) end@37@00))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@38@00))) $Snap.unit))
; [eval] this.next != end ==> this.data <= this.next.data
; [eval] this.next != end
(push) ; 5
; [then-branch: 47 | First:(Second:($t@38@00)) != end@37@00 | dead]
; [else-branch: 47 | First:(Second:($t@38@00)) == end@37@00 | live]
(push) ; 6
; [else-branch: 47 | First:(Second:($t@38@00)) == end@37@00]
(pop) ; 6
(pop) ; 5
; Joined path conditions
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@41@00 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@38@00)))
      end@37@00))
  (=
    (as joined_unfolding@41@00  Bool)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@38@00)))
          end@37@00))
      (<=
        ($SortWrappers.$SnapToInt ($Snap.first $t@38@00))
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))))))
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@38@00))) end@37@00)
  (= (as joined_unfolding@41@00  Bool) true)))
; Joined path conditions
(assert (lseg%trigger ($Snap.first ($Snap.second ($Snap.second $t@38@00))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@38@00))) end@37@00))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@38@00)))
      end@37@00))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@38@00)))
        end@37@00))
    (=
      ($Snap.first ($Snap.second ($Snap.second $t@38@00)))
      ($Snap.combine
        ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@38@00))))
        ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@38@00)))
        $Ref.null))
    (=
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00)))))
        ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00)))))))
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))
      $Snap.unit)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))
          end@37@00))
      (=
        (as joined_unfolding@40@00  Bool)
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))
              end@37@00))
          (<=
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@38@00)))))
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))))))))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))
        end@37@00)
      (= (as joined_unfolding@40@00  Bool) true))
    (lseg%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00)))))) end@37@00)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))
          end@37@00))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))
            end@37@00))
        (=
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))
          ($Snap.combine
            ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00)))))))
            ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00)))))))))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))
            $Ref.null))
        (=
          ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00)))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))))
            ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))))))
        (=
          ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00)))))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00)))))))))))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00)))))))))
          $Snap.unit)
        (as recunf@39@00  Bool)))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))
        end@37@00)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))
          end@37@00)
        (=
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))
          $Snap.unit)))
    (or
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))
        end@37@00)
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@38@00))))))
          end@37@00)))
    (as joined_unfolding@40@00  Bool))))
; Joined path conditions
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@38@00))) end@37@00)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@38@00)))
      end@37@00)
    (= ($Snap.first ($Snap.second ($Snap.second $t@38@00))) $Snap.unit))))
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@38@00))) end@37@00)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@38@00)))
      end@37@00))))
(assert (as joined_unfolding@41@00  Bool))
(pop) ; 2
(push) ; 2
; [else-branch: 41 | this@36@00 == end@37@00]
(assert (= this@36@00 end@37@00))
(declare-const $t@42@00 $Snap)
(assert (= $t@42@00 $Snap.unit))
(pop) ; 2
(pop) ; 1
; ---------- List ----------
(declare-const this@43@00 $Ref)
(push) ; 1
(declare-const $t@44@00 $Snap)
(assert (= $t@44@00 ($Snap.combine ($Snap.first $t@44@00) ($Snap.second $t@44@00))))
(assert (not (= this@43@00 $Ref.null)))
(pop) ; 1
