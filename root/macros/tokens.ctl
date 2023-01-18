use {
	"builtin"
}

pub struct Span {
	pub start: u32
	pub end: u32
}

impl Copy for Span

pub struct Token {
	pub kind: TokenKind
	pub span: Span
}

impl Copy for Token