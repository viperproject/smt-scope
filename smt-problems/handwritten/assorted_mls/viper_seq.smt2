; This is a simplified version of the matching loop found at:
; https://github.com/viperproject/silicon/blob/v.24.08-release/src/main/resources/dafny_axioms/sequences.vpr#L123-L127

(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :smt.MBQI false)
(set-option :smt.QI.EAGER_THRESHOLD 100)
(set-option :smt.refine_inj_axioms false)

(declare-sort MySeq)
(declare-fun Seq_length (MySeq) Int)
(declare-fun Seq_take (MySeq Int) MySeq)
(declare-fun Seq_append (MySeq MySeq) MySeq)

(assert (forall ((s MySeq) (t MySeq) (n Int))
    (! (=> (and (> n 0) (< (Seq_length s) n))
        (= (Seq_take (Seq_append s t) n) (Seq_append s (Seq_take t (- n (Seq_length s))))))
        :pattern ((Seq_take (Seq_append s t) n))
        :qid take_append_defn
    )))

(assert (forall ((q MySeq) (n Int))
    (! (=> (<= (Seq_length q) n)
        (= (Seq_take q n) q))
        :pattern ((Seq_take q n))
        :qid take_length
    )))

(assert (forall ((s MySeq) (t MySeq))
    (! (= (Seq_length (Seq_append s t)) (+ (Seq_length s) (Seq_length t)))
        :pattern ((Seq_length (Seq_append s t)))
        :qid length_append
    )))

(declare-const s0 MySeq)
(declare-const t0 MySeq)
(declare-const n0 Int)

(assert (and (> n0 0) (> n0 (Seq_length (Seq_append (Seq_take s0 1) t0)))))

(assert (= (Seq_take (Seq_append (Seq_take s0 1) t0) n0) t0))

(check-sat)
