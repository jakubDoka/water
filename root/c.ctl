pub fn malloc(size: uint) -> ^mut () extern

pub fn free(ptr: ^mut ()) extern

pub fn memcpy(dst: ^mut (), src: ^(), size: uint) extern

pub fn realloc(ptr: ^mut (), new_size: uint) -> ^mut () extern