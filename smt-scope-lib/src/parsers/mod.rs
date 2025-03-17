use crate::FResult;
use crate::FatalError;

pub use self::wrapper_async_parser::*;
pub use self::wrapper_stream_parser::*;
use futures::{AsyncBufRead, AsyncBufReadExt, AsyncRead};
use std::fmt::Debug;
use std::fs::{File, Metadata};
use std::io::{BufRead, BufReader};
use std::path::Path;
use std::time::Duration;
use wasm_timer::Instant;

pub mod z3;

#[cfg(not(feature = "mem_dbg"))]
pub trait LogParserHelper: Default {}
#[cfg(not(feature = "mem_dbg"))]
impl<T: Default> LogParserHelper for T {}

#[cfg(feature = "mem_dbg")]
pub trait LogParserHelper: Default + mem_dbg::MemDbg + mem_dbg::MemSize {}
#[cfg(feature = "mem_dbg")]
impl<T: Default + mem_dbg::MemDbg + mem_dbg::MemSize> LogParserHelper for T {}

/// Trait for a generic SMT solver trace parser. Intended to support different
/// solvers or log formats.
pub trait LogParser: LogParserHelper {
    /// Can be used to allow for parsing entries across multiple lines.
    fn is_line_start(&mut self, _first_byte: u8) -> bool {
        true
    }

    /// Process a single line of the log file. Return `true` if parsing should
    /// continue, or `false` if parsing should stop.
    fn process_line(&mut self, line: &str, line_no: usize) -> FResult<bool>;

    fn end_of_file(&mut self);

    /// Creates a new parser. Only use this if you cannot use the following
    /// convenience methods:
    /// - [`new_file`] for creating a streaming parser from a file path
    /// - [`new_str`] or [`new_string`] for creating a parser from a strings
    fn from<'r, R: BufRead + 'r>(reader: R) -> StreamParser<'r, Self> {
        StreamParser::new(reader)
    }
    /// Creates a new async parser from an async buffered reader. The parser
    /// will read rom the reader line-by-line.
    fn from_async<'r, R: AsyncBufRead + Unpin + 'r>(reader: R) -> AsyncParser<'r, Self> {
        AsyncParser::new(reader)
    }

    /// Creates a new parser from the contents of a log file. The string
    /// argument must live as long as parsing is ongoing. Release this
    /// constraint by using [`take_parser`](StreamParser::take_parser) to end
    /// parsing. If you want the parser to take ownership of the string instead
    /// (i.e. you are running into lifetime issues), use
    /// [`from_string`](Self::from_string) instead.
    fn from_str(s: &str) -> StreamParser<'_, Self> {
        s.as_bytes().into_parser()
    }

    /// See [`from_str`](LogParser::from_str) and [`process_all`](StreamParser::process_all).
    fn from_str_all(s: &str) -> Result<Self, FatalError> {
        Self::from_str(s).process_all()
    }

    /// Creates a new parser from the contents of a log file. The parser takes
    /// ownership over the string.
    fn from_string(s: String) -> StreamParser<'static, Self> {
        s.into_cursor().into_parser()
    }

    /// See [`from_string`](LogParser::from_string) and [`process_all`](StreamParser::process_all).
    fn from_string_all(s: String) -> Result<Self, FatalError> {
        Self::from_string(s).process_all()
    }

    /// Creates a new streaming parser from a file. Additionally returns the
    /// file metadata so that the progress can be calculated from the file size.
    ///
    /// This method is an alternative to
    /// `from_string(fs::read_to_string(self)?)`. This approach to parsing is
    /// ~5% slower, but should use only ~50% as much memory due to not having
    /// the entire loaded String in memory.
    fn from_file<P: AsRef<Path>>(p: P) -> std::io::Result<(Metadata, StreamParser<'static, Self>)> {
        let (meta, reader) = p.read_open()?;
        Ok((meta, reader.into_parser()))
    }

    /// See [`from_file`](LogParser::from_file) and [`process_all`](StreamParser::process_all).
    fn from_file_all<P: AsRef<Path>>(p: P) -> Result<Self, FatalError> {
        let (_, parser) = Self::from_file(p)?;
        parser.process_all()
    }
}

////////////////////
// Parser Creation
////////////////////

pub trait IntoStreamParser<'r> {
    /// Creates a new parser from a buffered reader.
    fn into_parser<Parser: LogParser>(self) -> StreamParser<'r, Parser>;
}
impl<'r, R: BufRead + 'r> IntoStreamParser<'r> for R {
    fn into_parser<Parser: LogParser>(self) -> StreamParser<'r, Parser> {
        Parser::from(self)
    }
}

pub trait CursorRead: AsRef<[u8]> + Sized {
    /// Turns any `[u8]` data such as a [`String`] into a
    /// [`Cursor`](std::io::Cursor) which implements
    /// [`BufRead`](std::io::BufRead). Intended to be chained with
    /// [`into_parser`](IntoStreamParser::into_parser).
    fn into_cursor(self) -> std::io::Cursor<Self> {
        std::io::Cursor::new(self)
    }
}
impl<T: AsRef<[u8]>> CursorRead for T {}

pub trait FileRead: AsRef<Path> + Sized {
    /// Opens a file and returns a buffered reader and the file's metadata. A
    /// more memory efficient alternative to
    /// `fs::read_to_string(self)?.into_cursor()`.
    fn read_open(self) -> std::io::Result<(Metadata, BufReader<File>)> {
        let file = File::open(self)?;
        let metadata = file.metadata()?;
        let reader = BufReader::new(file);
        Ok((metadata, reader))
    }
}
impl<T: AsRef<Path>> FileRead for T {}

pub trait IntoAsyncParser<'r> {
    /// Creates a new parser from an async buffered reader.
    fn into_async_parser<Parser: LogParser>(self) -> AsyncParser<'r, Parser>;
}
impl<'r, R: AsyncBufRead + Unpin + 'r> IntoAsyncParser<'r> for R {
    fn into_async_parser<Parser: LogParser>(self) -> AsyncParser<'r, Parser> {
        Parser::from_async(self)
    }
}

pub trait AsyncBufferRead: AsyncRead + Sized {
    /// Buffers any [`AsyncRead`](futures::io::AsyncRead) stream into a
    /// [`BufAsyncRead`](futures::io::BufReader) stream. Do not use this if the
    /// underlying stream already implements
    /// [`BufAsyncRead`](futures::io::BufReader).
    fn buffer(self) -> futures::io::BufReader<Self> {
        futures::io::BufReader::new(self)
    }
}
impl<T: AsyncRead> AsyncBufferRead for T {}

pub trait AsyncCursorRead: AsRef<[u8]> + Unpin + Sized {
    /// Turns any `[u8]` data such as a [`String`] into a async
    /// [`Cursor`](futures::io::Cursor) which implements
    /// [`AsyncBufRead`](futures::io::AsyncBufRead). Intended to be chained with
    /// [`into_async_parser`](IntoAsyncParser::into_async_parser).
    fn into_async_cursor(self) -> futures::io::Cursor<Self> {
        futures::io::Cursor::new(self)
    }
}
impl<T: AsRef<[u8]> + Unpin> AsyncCursorRead for T {}

////////////////////
// Parser Execution
////////////////////

#[derive(Debug, Clone)]
pub enum ParseState<T> {
    Paused(T, ReaderState),
    Completed { end_of_stream: bool },
    Error(FatalError),
}

impl<T> ParseState<T> {
    pub fn is_timeout(&self) -> bool {
        matches!(self, Self::Paused(..))
    }
    pub fn error(&self) -> Option<&FatalError> {
        match self {
            Self::Error(err) => Some(err),
            _ => None,
        }
    }

    fn map<U>(self, f: impl FnOnce(T) -> U) -> ParseState<U> {
        match self {
            Self::Paused(t, rs) => ParseState::Paused(f(t), rs),
            Self::Completed { end_of_stream } => ParseState::Completed { end_of_stream },
            Self::Error(err) => ParseState::Error(err),
        }
    }
}

/// Progress information for a parser.
#[derive(Debug, Clone, Copy, Default, PartialEq, Eq)]
pub struct ReaderState {
    /// The number of bytes parsed so far.
    pub bytes_read: usize,
    /// The number of lines parsed so far.
    pub lines_read: usize,
}

#[duplicate::duplicate_item(
    EitherParser   ReadBound                   async   add_await(code);
    [StreamParser] [BufRead + 'r]              []      [code];
    [AsyncParser]  [AsyncBufRead + Unpin + 'r] [async] [code.await];
)]
mod wrapper {
    use super::*;
    enum Never {}

    /// Struct which contains both a parser state as well as the stream of lines
    /// which are being parsed. Always use this instead of the raw underlying
    /// parser. Feeds the parser line-by-line with a callback to indicate if or
    /// when to pause. Supports any parser as long as it implements
    /// [`LogParser`].
    pub struct EitherParser<'r, Parser: LogParser> {
        reader: Option<Box<dyn ReadBound>>,
        reader_state: ReaderState,
        parser: Parser,
    }
    impl<'r, Parser: LogParser, R: ReadBound> From<R> for EitherParser<'r, Parser> {
        fn from(reader: R) -> Self {
            Self::new(reader)
        }
    }
    impl<'r, Parser: LogParser> EitherParser<'r, Parser> {
        pub(super) fn new(reader: impl ReadBound) -> Self {
            Self {
                reader: Some(Box::new(reader)),
                reader_state: ReaderState::default(),
                parser: Parser::default(),
            }
        }

        /// Get the current parser state.
        pub fn parser(&self) -> &Parser {
            &self.parser
        }
        /// Get the current parser state.
        pub fn take_parser(mut self) -> Parser {
            if let Some(reader) = self.reader.take() {
                drop(reader);
                self.parser.end_of_file();
            }
            self.parser
        }
        /// Get the current reader progress.
        pub fn reader_state(&self) -> ReaderState {
            self.reader_state
        }
        /// Have we finished parsing?
        pub fn is_done(&self) -> bool {
            self.reader.is_none()
        }

        async fn process_line(
            reader: &mut Box<dyn ReadBound>,
            reader_state: &mut ReaderState,
            parser: &mut Parser,
            buf: &mut String,
        ) -> Result<Option<bool>, FatalError> {
            buf.clear();
            // Read line
            let mut bytes_read = 0;

            loop {
                bytes_read += add_await([reader.read_line(buf)])?;
                reader_state.lines_read += 1;
                let peek = add_await([reader.fill_buf()])?;
                // Stop reading if this is the end or we don't have a multiline.
                if peek.is_empty() || parser.is_line_start(peek[0]) {
                    break;
                }
            }
            if bytes_read == 0 {
                return Ok(Some(true));
            }
            // Remove newline from end
            if buf.ends_with('\n') {
                buf.pop();
                if buf.ends_with('\r') {
                    buf.pop();
                }
            } else {
                // Ignore the last line in a file if it doesn't end with a
                // newline, this happens if the process writing to it was
                // killed.
                return Ok(Some(true));
            }

            // Parse line
            reader_state.bytes_read += bytes_read;
            let stop_parsing = !parser.process_line(buf, reader_state.lines_read)?;
            Ok(stop_parsing.then_some(false))
        }

        /// Parse the the input while calling the `predicate` callback after
        /// each line. Keep parsing until the callback returns `Some(t)` or we
        /// reach the end of the input. If we stopped due to the callback,
        /// return the current progress as `ParseState::Paused(t, state)`. After
        /// this function returns, use [`parser`](Self::parser) to retrieve the
        /// parser state.
        ///
        /// The `predicate` callback should aim to return quickly since **it is
        /// called between each line!** If heavier processing is required
        /// consider using [`process_check_every`] or [`process_until_every`].
        pub async fn process_until<T>(
            &mut self,
            mut predicate: impl FnMut(&Parser, ReaderState) -> Option<T>,
        ) -> ParseState<T> {
            let Some(reader) = self.reader.as_mut() else {
                return ParseState::Completed {
                    end_of_stream: true,
                };
            };
            let mut buf = String::new();
            loop {
                if let Some(t) = predicate(&self.parser, self.reader_state) {
                    return ParseState::Paused(t, self.reader_state);
                }
                let state = match add_await([Self::process_line(
                    reader,
                    &mut self.reader_state,
                    &mut self.parser,
                    &mut buf,
                )]) {
                    Ok(None) => continue,
                    Ok(Some(end_of_stream)) => ParseState::Completed { end_of_stream },
                    Err(err) => ParseState::Error(err),
                };
                drop(self.reader.take()); // Release file handle/free up memory
                self.parser.end_of_file();
                return state;
            }
        }
        /// Identical to [`process_until`] except the predicate is only checked
        /// every `lines_per_check` lines.
        pub async fn process_until_every<T>(
            &mut self,
            mut predicate: impl FnMut(&Parser, ReaderState) -> Option<T>,
            lines_per_check: usize,
        ) -> ParseState<T> {
            assert!(lines_per_check > 0);
            let mut remaining = lines_per_check;
            add_await([self.process_until(move |p, rs| {
                remaining -= 1;
                if remaining == 0 {
                    remaining = lines_per_check;
                    predicate(p, rs)
                } else {
                    None
                }
            })])
        }

        /// Parse the the input while calling the `predicate` callback every
        /// `delta` time. Keep parsing until the callback returns `Some(t)` or
        /// we reach the end of the input. If we stopped due to the callback,
        /// return the current progress as `ParseState::Paused(t, state)`. After
        /// this function returns, use [`parser`](Self::parser) to retrieve the
        /// parser state.
        pub async fn process_check_every<T>(
            &mut self,
            delta: Duration,
            mut predicate: impl FnMut(&Parser, ReaderState) -> Option<T>,
        ) -> ParseState<T> {
            // Calling `Instant::now` between each line can get expensive, so
            // we'll try to avoid it. We will try to check every
            // `MAX_LINES_PER_TIME_VARIATION * time_left`, ensuring that we
            // never go over time as long as the lines-per-time of the parser
            // does not drop by more than `MAX_TIME_OVER_APPROX` between checks.
            // The closer this is to `1`, the fewer checks we'll do.
            const MAX_LINES_PER_TIME_VARIATION: u128 = 50;
            let initial_lines_per_check =
                delta.as_millis().try_into().unwrap_or(usize::MAX).max(10);
            // How many lines must pass before we check time again?
            let mut lines_per_check = initial_lines_per_check;
            // How many lines until the next time check?
            let mut next_check = lines_per_check;
            let max_lpc = lines_per_check.checked_mul(2).unwrap_or(usize::MAX);
            let mut start = Instant::now();
            let mut last_check_time = start;
            add_await([self.process_until(move |p, rs| {
                next_check -= 1;
                if next_check == 0 {
                    let now = Instant::now();
                    match delta.checked_sub(now - start) {
                        Some(time_left) if !time_left.is_zero() => {
                            let time_left = time_left.as_nanos();
                            let check_delta = (now - last_check_time).as_nanos();
                            last_check_time = now;
                            if check_delta < MAX_LINES_PER_TIME_VARIATION {
                                lines_per_check = 1;
                            } else {
                                let check_delta = check_delta
                                    .checked_mul(MAX_LINES_PER_TIME_VARIATION)
                                    .unwrap_or(u128::MAX);
                                // How much smaller is `lines_per_check` than it
                                // should be?
                                let under_approx = (time_left / check_delta)
                                    .try_into()
                                    .unwrap_or(usize::MAX)
                                    .max(1);
                                // Do rounding up division to make sure
                                // `over_approx > 1` as soon as `check_delta >
                                // time_left`.
                                let over_approx = (check_delta + time_left - 1) / time_left;
                                // How much larger is `lines_per_check` than it
                                // should be?
                                let over_approx =
                                    over_approx.try_into().unwrap_or(usize::MAX).max(1);
                                let new_lpc = (lines_per_check * under_approx) / over_approx;
                                lines_per_check = new_lpc.min(max_lpc).max(1);
                            }
                            next_check = lines_per_check;
                        }
                        _ => {
                            // Out of time, reset to initial values and call
                            // the predicate.
                            lines_per_check = initial_lines_per_check;
                            next_check = lines_per_check;
                            start = now;
                            last_check_time = now;
                            return predicate(p, rs);
                        }
                    }
                }
                None
            })])
        }

        /// Parse the entire file as a stream. Using [`process_all_timeout`]
        /// instead is recommended as this method will cause the process to hang
        /// if given a very large file.
        pub async fn process_all(mut self) -> FResult<Parser> {
            match add_await([self.process_until(|_, _| None::<Never>)]) {
                ParseState::Paused(n, _) => match n {},
                ParseState::Completed { .. } => Ok(self.take_parser()),
                ParseState::Error(err) => Err(err),
            }
        }
        /// Try to parse everything, but stop after a given timeout. The result
        /// tuple contains `ParseState::Paused(read_info)` if the timeout was
        /// reached, and the parser state at the end (i.e. the state is complete
        /// only if `ParseState::Completed` was returned).
        ///
        /// Parsing cannot be resumed if the timeout is reached. If you need
        /// support for resuming, use [`process_check_every`] or
        /// [`process_until`] instead.
        pub async fn process_all_timeout(mut self, timeout: Duration) -> (ParseState<()>, Parser) {
            let result = add_await([self.process_check_every(timeout, |_, _| Some(()))]);
            (result, self.take_parser())
        }
        /// Try to parse everything, but stop after parsing `bytes` bytes or
        /// `lines` lines (whichever comes first). The limit is ignored when set
        /// to `None` (i.e. if both are `None` this is identical to
        /// `process_all`). The result tuple contains
        /// `ParseState::Paused(read_info)` if the limit  was reached, and the
        /// parser state at the end (i.e. the state is complete only if
        /// `ParseState::Completed` was returned).
        ///
        /// Parsing cannot be resumed if the limit is reached. If you need
        /// support for resuming, use [`process_until`] instead.
        pub async fn process_all_limit(
            mut self,
            bytes: Option<usize>,
            lines: Option<usize>,
        ) -> (ParseState<()>, Parser) {
            let result = match (bytes, lines) {
                (Some(bytes), Some(lines)) => add_await([self.process_until(|_, s| {
                    (s.bytes_read >= bytes || s.lines_read >= lines).then_some(())
                })]),
                (Some(bytes), None) => {
                    add_await([self.process_until(|_, s| (s.bytes_read >= bytes).then_some(()))])
                }
                (None, Some(lines)) => {
                    add_await([self.process_until(|_, s| (s.lines_read >= lines).then_some(()))])
                }
                (None, None) => {
                    add_await([self.process_until(|_, _| None::<Never>)]).map(|n| match n {})
                }
            };
            (result, self.take_parser())
        }
    }
}
