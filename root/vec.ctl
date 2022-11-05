pub fn "default" malloc(size: uint) -> ^mut () extern
pub fn "default" free(ptr: ^()) extern
pub fn "default" memcpy(dst: ^mut (), src: ^(), size: uint) extern

pub struct [T] Vec {
    ptr: ^mut T;
    len: uint;
    cap: uint;
};

pub impl [T] Vec[T] {
    fn new() -> Self {
        \{
            ptr: cast(0)
            len: 0
            cap: 0
        }
    }

    fn with_capacity(cap: uint) -> Self {
        \{
            ptr: cast(malloc(cap * sizeof\[T]()))
            len: 0
            cap
        }
    }

    fn push(self: ^mut Self, val: T) {
        if self.len == self.cap {
            self.grow()
        }
        *self.get(self.len - 1) = val
        self.len = self.len + 1
    }

    fn grow(self: ^mut Self) {
        let next_len = if self.cap == 0 => 1
        else => self.cap * 2
        let new_alloc = malloc(next_len * sizeof\[T]())
        memcpy(new_alloc, cast(self.ptr), self.len * sizeof\[T]())
        free(cast(self.ptr))
        self.ptr = cast(new_alloc)
    }

    fn get(self: ^Self, index: uint) -> ^T {
        cast(cast\[^mut T, uint](self.ptr) + index * sizeof\[T]())
    }

    fn get_mut(self: ^mut Self, index: uint) -> ^mut T {
        cast(cast\[^mut T, uint](self.ptr) + index * sizeof\[T]())
    }
}