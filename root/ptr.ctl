#[no_moves]
pub fn [T] write(dest: ^mut T, value: T) {
    *dest = value
}
#[no_moves]
pub fn [T] read(src: ^T) -> T => *src
