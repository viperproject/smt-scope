use wasm_bindgen::JsValue;
use web_sys::SvgsvgElement;

#[derive(Debug, Clone, Copy)]
pub struct ViewBox {
    pub x: f64,
    pub y: f64,
    pub width: f64,
    pub height: f64,
}

pub trait SvgHelper {
    fn get_view_box(&self) -> Option<ViewBox>;
    fn set_view_box(&self, view_box: ViewBox) -> Result<(), JsValue>;

    fn _get_width(&self) -> Option<f64>;
    fn _set_width(&self, width: f64) -> Result<(), JsValue>;

    fn _get_height(&self) -> Option<f64>;
    fn _set_height(&self, height: f64) -> Result<(), JsValue>;
}

impl SvgHelper for SvgsvgElement {
    fn get_view_box(&self) -> Option<ViewBox> {
        let view_box = self.get_attribute("viewBox")?;
        let mut view_box = view_box.split_ascii_whitespace().map(|s| s.parse());
        let x = view_box.next()?.ok()?;
        let y = view_box.next()?.ok()?;
        let width = view_box.next()?.ok()?;
        let height = view_box.next()?.ok()?;
        Some(ViewBox {
            x,
            y,
            width,
            height,
        })
    }
    fn set_view_box(&self, view_box: ViewBox) -> Result<(), JsValue> {
        self.set_attribute(
            "viewBox",
            &format!(
                "{} {} {} {}",
                view_box.x, view_box.y, view_box.width, view_box.height
            ),
        )
    }

    fn _get_width(&self) -> Option<f64> {
        self.get_attribute("width")?
            .strip_suffix("pt")?
            .parse()
            .ok()
    }
    fn _set_width(&self, width: f64) -> Result<(), JsValue> {
        self.set_attribute("width", &format!("{width}pt"))
    }

    fn _get_height(&self) -> Option<f64> {
        self.get_attribute("height")?
            .strip_suffix("pt")?
            .parse()
            .ok()
    }
    fn _set_height(&self, height: f64) -> Result<(), JsValue> {
        self.set_attribute("height", &format!("{height}pt"))
    }
}
