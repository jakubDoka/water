use {
	"./option"
	"./macros/tokens"
	"./vec"
	"./ptr"
	"./c"
}

fn [T] drop(v: T) {}

#[entry]
fn main {
	let a = Vec\[uint]\new()

	let mut i = 0u32
	loop if i == 10u32 => break
	else {
		a.push(i)
		i = i + 1
	}

	let mut i = 0
	loop if i == a.len() => break
	else {
		c\putchar(cast(cast\[char, u32]('0') + *a.get_ptr(i)))
	}
}