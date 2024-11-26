use std::num::NonZeroUsize;

use palette::{encoding::Srgb, white_point::D65, FromColor, Hsluv, Hsv, LuvHue};
use smt_log_parser::{items::QuantIdx, FxHashMap, TiVec, Z3Parser};

#[derive(Debug, Clone)]
pub struct QuantIdxToColourMap {
    quants: FxHashMap<Option<QuantIdx>, u32>,
    coprime: NonZeroUsize,
    shift: usize,
}

impl QuantIdxToColourMap {
    pub fn new(parser: &Z3Parser) -> Self {
        let mut instd: TiVec<QuantIdx, bool> = parser.quantifiers().iter().map(|_| false).collect();
        let mut non_quant_insts = false;
        for inst in parser.instantiations() {
            let match_ = &parser[inst.match_];
            let Some(qidx) = match_.kind.quant_idx() else {
                non_quant_insts = true;
                continue;
            };
            instd[qidx] = true;
        }
        let mut quants: FxHashMap<Option<QuantIdx>, u32> = Default::default();
        if non_quant_insts {
            quants.insert(None, 0);
        }
        for (qidx, instd) in instd.into_iter_enumerated() {
            if instd {
                let idx = quants.len() as u32;
                quants.insert(Some(qidx), idx);
            }
        }

        let total_count = quants.len();
        Self {
            quants,
            coprime: Self::find_coprime(total_count),
            // Currently `idx == 0` will always have the same hue of 0, if we do
            // not want this behaviour pick a random number here instead.
            shift: 0,
        }
    }

    fn total_count(&self) -> usize {
        self.quants.len()
    }

    pub fn get(&self, qidx: Option<QuantIdx>) -> LuvHue<f64> {
        let idx = self.quants[&qidx] as usize;
        // debug_assert!(idx < idx);
        let idx_perm = (idx * self.coprime.get() + self.shift) % self.total_count();
        LuvHue::new(360. * idx_perm as f64 / self.total_count() as f64)
    }
    pub fn get_rbg_hue(&self, qidx: Option<QuantIdx>) -> f64 {
        let hue = self.get(qidx);
        let colour = Hsluv::<D65, f64>::new(hue, 100.0, 50.0);
        let colour = Hsv::<Srgb, f64>::from_color(colour);
        colour.hue.into_positive_degrees()
    }

    #[allow(clippy::out_of_bounds_indexing)]
    fn find_coprime(n: usize) -> NonZeroUsize {
        // Workaround since `unwrap` isn't allowed in const functions.
        const ONE: NonZeroUsize = match NonZeroUsize::new(1) {
            Some(nz) => nz,
            None => [][0],
        };
        // We try to find a coprime at around `n.30303...` to achieve a period
        // of around 10 distinct colours for subsequent indices:
        // 0.303, 0.606, 0.909, 0.212, 0.515, 0.818, 0.121, 0.424, 0.727, 0.030.
        // That is, we get a group of 10 colours that are at least 0.1 apart,
        // and then recursively 10 groups of 10 which are at least 0.01 apart, etc.
        let aim = (n as u128)
            .checked_mul(99 + 30)
            .map(|aim| aim / 99 - 1)
            .and_then(|aim| usize::try_from(aim).ok());
        let Some(mut aim) = aim.and_then(NonZeroUsize::new) else {
            return ONE;
        };
        let Some(n) = NonZeroUsize::new(n) else {
            return ONE;
        };
        use gcd::Gcd;
        while n.gcd(aim) != ONE {
            let Some(new) = aim.checked_add(1) else {
                return ONE;
            };
            aim = new;
        }
        aim
    }
}
