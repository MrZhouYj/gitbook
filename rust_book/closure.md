# rust 闭包

```rust
	let closure = |params| {
     params
  }
```

如上所示 就是rust中定义了一个闭包存储在变量closure中

闭包定义以 两个`|`开始，竖线中指定了闭包的参数，如果有多个参数用逗号分隔开 `|params1,params2|`

参数之后是存放闭包体的大括号 —— 如果闭包体只有一行则大括号是可以省略的。大括号之后闭包的结尾，需用于 `let` 语句的分号。因为闭包体的最后一行没有分号（正如函数体一样），所以闭包体（`params`）最后一行的返回值作为调用闭包时的返回值 。

### 关于闭包中参数类型的一个例子

```rust
let example_closure = |x| x;

let s = example_closure(String::from("hello"));
let n = example_closure(5);
```

编译器报错如下：

```rust
error[E0308]: mismatched types
 --> src/main.rs
  |
  | let n = example_closure(5);
  |                         ^ expected struct `std::string::String`, found
  integer
  |
  = note: expected type `std::string::String`
             found type `{integer}`
```

第一次使用 `String` 值调用 `example_closure` 时，编译器推断 `x` 和此闭包返回值的类型为 `String`。接着这些类型被锁定进闭包 `example_closure` 中，如果尝试对同一闭包使用不同类型则会得到类型错误。

### 闭包会捕获环境变量

