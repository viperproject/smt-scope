use std::ops::{Add, AddAssign, Div, DivAssign, Mul, MulAssign, Neg, Sub, SubAssign};

use yew::{DragEvent, MouseEvent};

#[derive(Debug, Clone, Copy, PartialEq, Default)]
pub struct Position<T> {
    pub x: T,
    pub y: T,
}
pub type PagePosition = Position<i32>;
pub type PrecisePosition = Position<f64>;

impl PrecisePosition {
    pub fn min(self, other: Self) -> Self {
        Self {
            x: self.x.min(other.x),
            y: self.y.min(other.y),
        }
    }
    pub fn max(self, other: Self) -> Self {
        Self {
            x: self.x.max(other.x),
            y: self.y.max(other.y),
        }
    }
}

impl From<&MouseEvent> for PagePosition {
    fn from(event: &MouseEvent) -> Self {
        PagePosition {
            x: event.page_x(),
            y: event.page_y(),
        }
    }
}
impl From<&DragEvent> for PagePosition {
    fn from(event: &DragEvent) -> Self {
        PagePosition {
            x: event.page_x(),
            y: event.page_y(),
        }
    }
}

// Mathematical operations

impl<T: Add> Add for Position<T> {
    type Output = Position<T::Output>;
    fn add(self, rhs: Self) -> Position<T::Output> {
        Position {
            x: self.x + rhs.x,
            y: self.y + rhs.y,
        }
    }
}
impl<T: AddAssign> AddAssign for Position<T> {
    fn add_assign(&mut self, rhs: Self) {
        self.x += rhs.x;
        self.y += rhs.y;
    }
}
impl<T: Sub> Sub for Position<T> {
    type Output = Position<T::Output>;
    fn sub(self, rhs: Self) -> Position<T::Output> {
        Position {
            x: self.x - rhs.x,
            y: self.y - rhs.y,
        }
    }
}
impl<T: SubAssign> SubAssign for Position<T> {
    fn sub_assign(&mut self, rhs: Self) {
        self.x -= rhs.x;
        self.y -= rhs.y;
    }
}

impl<V: Copy, T: Mul<V>> Mul<V> for Position<T> {
    type Output = Position<T::Output>;
    fn mul(self, rhs: V) -> Position<T::Output> {
        Position {
            x: self.x * rhs,
            y: self.y * rhs,
        }
    }
}
impl<V: Copy, T: MulAssign<V>> MulAssign<V> for Position<T> {
    fn mul_assign(&mut self, rhs: V) {
        self.x *= rhs;
        self.y *= rhs;
    }
}
impl<V: Copy, T: Div<V>> Div<V> for Position<T> {
    type Output = Position<T::Output>;
    fn div(self, rhs: V) -> Position<T::Output> {
        Position {
            x: self.x / rhs,
            y: self.y / rhs,
        }
    }
}
impl<V: Copy, T: DivAssign<V>> DivAssign<V> for Position<T> {
    fn div_assign(&mut self, rhs: V) {
        self.x /= rhs;
        self.y /= rhs;
    }
}
impl<T: Neg> Neg for Position<T> {
    type Output = Position<T::Output>;
    fn neg(self) -> Position<T::Output> {
        Position {
            x: -self.x,
            y: -self.y,
        }
    }
}
