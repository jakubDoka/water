use {
    "./option"
    "./macros/tokens"
    "./marker"
    "./vec"
    "./ptr"
}

fn "default" putchar(c: char) -> u32 extern

struct A {
    mut f: char
}

impl Drop for A {
    fn drop(s: ^mut Self) {
       putchar(s.f)
    }
}

fn [T] drop(value: T) {}

#[entry]
fn main {
    let a = A\{f:'\n'}
    let a = A\{f:'\n'}

    drop(a);
    putchar('H')
    putchar('e')
    putchar('l')
    putchar('l')
    putchar('o')
    putchar(',')
    putchar(' ')
    putchar('W')
    putchar('o')
    putchar('r')
    putchar('l')
    putchar('d')
    putchar('!')
}