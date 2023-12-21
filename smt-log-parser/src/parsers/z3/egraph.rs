use fxhash::{FxHashMap, FxHashSet};
use typed_index_collections::TiVec;

use crate::items::{ENodeIdx, EqualityExpl, InstIdx, StackIdx, TermIdx};

use super::stack::Stack;

#[derive(Debug, Default)]
pub struct EGraph {
    term_to_enode: FxHashMap<TermIdx, ENodeIdx>,
    enodes: TiVec<ENodeIdx, ENode>,
}

impl EGraph {
    pub fn new_enode(
        &mut self,
        created_by: Option<InstIdx>,
        term: TermIdx,
        z3_generation: Option<u32>,
        stack: &Stack,
    ) -> ENodeIdx {
        if created_by.is_none() && z3_generation.is_some() {
            // TODO: why does this happen sometimes?
            // debug_assert_eq!(
            //     z3_generation.unwrap(),
            //     0,
            //     "enode with no creator has non-zero generation"
            // );
        }
        let enode = self.enodes.push_and_get_key(ENode {
            frame: stack.active_frame(),
            created_by,
            owner: term,
            z3_generation,
            equalities: FxHashMap::default(),
            back_equalities: FxHashSet::default(),
        });
        self.term_to_enode.insert(term, enode);
        enode
    }

    pub fn get_enode(&self, term: TermIdx, stack: &Stack) -> Option<ENodeIdx> {
        let enode = *self.term_to_enode.get(&term)?;
        let frame = self.enodes[enode].frame;
        // This cannot be an enode if it points to a popped stack frame
        if frame
            .map(|f| !stack.stack_frames[f].active)
            .unwrap_or_default()
        {
            None
        } else {
            Some(enode)
        }
    }

    pub fn new_equality(&mut self, from: ENodeIdx, eq: EqualityExpl) {
        let to = eq.to();
        // Note: we save equalities where `from == to` but never use them.
        let eqs = self.enodes[from].equalities.entry(to).or_default();
        eqs.push(eq);
        self.enodes[to].back_equalities.insert(from);
    }

    pub fn get_equalities(&self, from: ENodeIdx, to: ENodeIdx) -> &[EqualityExpl] {
        self.enodes[from]
            .equalities
            .get(&to)
            .map(|e| &**e)
            .unwrap_or_default()
    }

    // TODO: unused due to being slow
    pub fn get_equalities_transitive(
        &self,
        from: ENodeIdx,
        to: ENodeIdx,
        visited: &mut FxHashSet<ENodeIdx>,
    ) -> Vec<&EqualityExpl> {
        // TODO: simplify
        if !visited.insert(from) {
            return Vec::new();
        }
        let mut forward: Vec<_> = self.enodes[from]
            .equalities
            .iter()
            .flat_map(|(tgt, eqs)| {
                if *tgt == to {
                    eqs.iter().collect()
                } else {
                    let mut eqs_sln = self.get_equalities_transitive(*tgt, to, visited);
                    if eqs_sln.is_empty() {
                        Vec::new()
                    } else {
                        eqs_sln.extend(eqs);
                        eqs_sln
                    }
                }
            })
            .collect();
        let backward = self.enodes[from].back_equalities.iter().flat_map(|tgt| {
            if *tgt == to {
                self.enodes[*tgt].equalities[&from].iter().collect()
            } else {
                let mut eqs_sln = self.get_equalities_transitive(*tgt, to, visited);
                if eqs_sln.is_empty() {
                    Vec::new()
                } else {
                    eqs_sln.extend(&self.enodes[*tgt].equalities[&from]);
                    eqs_sln
                }
            }
        });
        forward.extend(backward);
        visited.remove(&from);
        forward.dedup();
        forward
    }
}

#[derive(Debug)]
pub struct ENode {
    frame: Option<StackIdx>,
    pub created_by: Option<InstIdx>,
    pub owner: TermIdx,
    pub z3_generation: Option<u32>,

    pub equalities: FxHashMap<ENodeIdx, Vec<EqualityExpl>>,
    pub back_equalities: FxHashSet<ENodeIdx>,
}

impl std::ops::Index<ENodeIdx> for EGraph {
    type Output = ENode;
    fn index(&self, idx: ENodeIdx) -> &Self::Output {
        &self.enodes[idx]
    }
}
