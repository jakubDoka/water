use {
	"builtin"
	"./ptr"
	"./c"
}

pub struct [T] Vec {
	mut ptr: ^mut T
	mut len: uint
	mut cap: uint
}

pub impl [T] Vec\[T] {
	fn new() -> Self {
		\{ptr: cast(0), len: 0, cap: 0}
	}

	fn with_capacity(cap: uint) -> Self {
		\{ptr: cast(c\malloc(cap * sizeof\[T]())), len: 0, cap}
	}

	fn push(self: ^mut Self, val: T) {
		if self.len == self.cap {
			self.grow()
		}
		ptr\write(self.get_mut_ptr(self.len), val)
		self.len = self.len + 1
	}

	fn grow(self: ^mut Self) {
		let cap = if self.cap == 0 => 8
		else => self.cap * 2
		self.cap = cap
		self.ptr = cast(realloc(cast(self.ptr), self.cap * sizeof\[T]()))
	}

	fn get_ptr(self: ^Self, index: uint) -> ^T {
		cast(cast\[uint](self.ptr) + index * sizeof\[T]())
	}

	fn get_mut_ptr(self: ^mut Self, index: uint) -> ^mut T {
		cast(cast\[uint](self.ptr) + index * sizeof\[T]())
	}

	fn len(self: ^Self) -> uint => self.len
}

impl [T] Drop for Vec\[T] {
	fn drop(self: ^mut Self) {
		let mut i = 0
		loop if i == self.len => break
		else {
			ptr\read(self.get_ptr(i))
			i = i + 1
		}
		c\free(cast(self.ptr))
	}
}