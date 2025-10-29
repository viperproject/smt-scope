fn main() -> Result<(), Box<dyn std::error::Error>> {
    vergen::EmitBuilder::builder()
        .fail_on_error()
        .all_git()
        .emit()?;
    Ok(())
}
