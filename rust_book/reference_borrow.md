# reference和borrow

函数的传参分为传值传参和传址传参

```rust
fn main() {
    let s1 = String::from("hello");
    let len = calculate_length(&s1);
    println!("The length  of '{}' is {}.", s1, len);
}

fn calculate_length(s: &String) -> usize {
    s.len()
}
```

- &s1 语法让我们创建一个 指向 值 s1 的引用，但是并不拥有它。因为并不拥有这个值，当引用离开作用域时其指向的值也不会被丢弃。

- 将获取引用作为函数参数称为 借用（borrowing）。

可变引用有一个很大的限制：在特定作用域中的特定数据有且只有一个可变引用

参考：https://blog.csdn.net/qq_42896653/article/details/97618704