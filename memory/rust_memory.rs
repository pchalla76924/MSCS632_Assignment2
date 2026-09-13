// Rust: ownership, borrowing, and deterministic cleanup
fn sum(values: &[i32]) -> i32 {
    values.iter().sum()
}

fn main() {
    let values = Box::new(vec![1, 2, 3, 4, 5]);
    println!("sum = {}", sum(&values)); // immutable borrow; ownership stays here

    let moved_values = values; // ownership moves; values can no longer be used
    println!("length = {}", moved_values.len());
} // moved_values leaves scope; Box and Vec storage are released automatically
