use {
    "./option"
}

#[water_drop]
pub struct MacroLexer {
    _addr: ^()
}

pub impl MacroLexer {
    fn next(ml: MacroLexer) -> MacroToken => ctl_lexer_next(ml)
}

#[compile_time]
fn "default" ctl_lexer_next(lexer: MacroLexer) -> MacroToken extern

#[water_drop]
pub enum MacroTokenKind {
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

pub struct Span {
    pub start: u32
    pub end: u32
}

pub struct MacroToken {
    pub kind: MacroTokenKind
    pub span: Span
}

#[water_drop]
pub spec TokenMacro {
    fn "default" new(s: ^Self, lexer: MacroLexer)
    fn "default" next(s: ^Self, lexer: MacroLexer) -> Option[MacroToken]
    fn "default" drop(s: ^Self)
}