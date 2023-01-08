use {
    "./option"
    "./marker"
}#[water_drop]
pub enum TokenKind {
    Func
    Type
    Return
    Use
    Extern
    If
    Elif
    Else
    For
    Break
    Continue
    Let
    Struct
    Spec
    Enum
    Mut
    Impl
    As
    Match
    Pub
    Priv
    Const
    Comma
    Colon
    Dot
    RightArrow
    ThickRightArrow
    DoubleColon
    Hash
    DoubleHash
    BackSlash
    DoubleDot
    Tilde
    LeftCurly
    RightCurly
    LeftParen
    RightParen
    LeftBracket
    RightBracket
    Label
    Ident
    Int
    String
    Bool
    Char
    Comment
    Space
    Operator: u8
    NewLine
    Error
    Eof
    None
}
impl Copy for TokenKind
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
