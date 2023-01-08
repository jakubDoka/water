use {
    "./marker"
    "./ptr"
}

pub fn malloc(size: uint) -> ^mut () extern
pub fn free(ptr: ^()) extern
pub fn memcpy(dst: ^mut (), src: ^(), size: uint) extern

pub struct [T] Vec {
    mut ptr: ^mut T
    mut len: uint
    mut cap: uint
}

impl [T] Vec\[T] {
    fn new() -> Self {
        \{ptr: cast(0),
            len: 0,
            cap: 0}
    }
    
    fn with_capacity(cap: uint) -> Self {
        \{ptr: cast(malloc(cap * sizeof\[T]())),
            len: 0,
            cap}
    }
    
    fn push(self: ^mut Self, val: T) {
        if self.len == self.cap {
            self.grow()
        } 
        ptr\write(self.get_mut_ptr(self.len), val)
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
    
    fn get_ptr(self: ^Self, index: uint) -> ^T {
        cast(cast\[^mut T, uint](self.ptr) + index * sizeof\[T]())
    }
    
    fn get_mut_ptr(self: ^mut Self, index: uint) -> ^mut T {
        cast(cast\[^mut T, uint](self.ptr) + index * sizeof\[T]())
    }
}

impl [T] Drop for Vec\[T] {
    fn drop(self: ^mut Self) {
        let mut i = 0
        loop if i == self.len => break
        else {
            ptr\read(self.get_ptr(i))
            i = i + 1
        }
        free(cast(self.ptr))
    }
}
