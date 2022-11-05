use {
    "./option"
    "./marker"
}

#[water_drop]
pub struct MacroLexer {
    // replica of the rust layout
    _addr1: ^()
    _addr2: ^()
    _addr3: ^()
    _addr4: ^()
    _addr5: ^()
    _addr6: ^()
    _addr7: ^()
    _addr8: ^()
}

pub impl MacroLexer {
    fn next(ml: ^MacroLexer) -> MacroToken => ctl_lexer_next(ml)
}

#[compile_time]
fn "default" ctl_lexer_next(lexer: ^MacroLexer) -> MacroToken extern

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

impl Copy for MacroTokenKind

pub struct Span {
    pub start: u32
    pub end: u32
}

impl Copy for Span

pub struct MacroToken {
    pub kind: MacroTokenKind
    pub span: Span
}

impl Copy for MacroToken

#[water_drop]
pub spec TokenMacro {
    fn "default" new(s: ^Self, lexer: MacroLexer)
    fn "default" next(s: ^Self) -> Option[MacroToken]
    fn "default" drop(s: ^Self) -> MacroLexer
}