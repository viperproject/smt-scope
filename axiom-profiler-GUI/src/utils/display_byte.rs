const SIZE_NAMES: [&str; 5] = ["B", "KB", "MB", "GB", "TB"];

pub fn byte_size_display(mut size: f64) -> (f64, &'static str) {
    let mut idx = 0;
    while size >= 10_000.0 && idx + 1 < SIZE_NAMES.len() {
        size /= 1024.0;
        idx += 1;
    }
    (size, SIZE_NAMES[idx])
}
