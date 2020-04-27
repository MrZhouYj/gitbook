# rust基本类型

### Float

浮点型有两种类型：` f32` 和`f64`.  `f64`是浮点型字面值的默认类型

浮点型同样可以在字面值后加上其类型作为后缀用于标识类型：`3.1_f32`, `1.2f64`等

### 复合类型

 Rust中有两种基本的复合类型：元组和数组。它们都具有可存放多个值，固定大小的特点。不同之处在于元组可存放不同类型的值，而数组中所有值类型必须一样。

元组用一对 **( )** 包括的一组数据，可以包含不同种类的数据：

```rust
let tup: (i32, f64, u8) = (500, 6.4, 1);
// tup.0 等于 500
// tup.1 等于 6.4
// tup.2 等于 1
let (x, y, z) = tup;
// y 等于 6.4
```

数组用一对 **[ ]** 包括的同类型数据。

```rust
let a = [1, 2, 3, 4, 5];
// a 是一个长度为 5 的整型数组

let b = ["January", "February", "March"];
// b 是一个长度为 3 的字符串数组

let c: [i32; 5] = [1, 2, 3, 4, 5];
// c 是一个长度为 5 的 i32 数组

let d = [3; 5];
// 等同于 let d = [3, 3, 3, 3, 3];

let first = a[0];
let second = a[1];
// 数组访问

a[0] = 123; // 错误：数组 a 不可变
let mut a = [1, 2, 3];
a[0] = 4; // 正确
```

### char

字符型用 char 表示。

Rust的 char 类型大小为 4 个字节，代表 Unicode标量值，这意味着它可以支持中文，日文和韩文字符等非英文字符甚至表情符号和零宽度空格在 Rust 中都是有效的 char 值。



### 泛型 

#### 在函数定义中使用泛型

定义函数时可以在函数签名的参数数据类型和返回值中使用泛型。

```rust
fn largest<T>(list: &[T]) -> T {}
```

#### 结构体定义中的泛型

使用 `<>` 来定义拥有一个或多个泛型参数类型字段的结构体。

```rust
struct Point<T, U> {
    x: T,
    y: U,
}
```

#### 枚举定义中的泛型数据类型

```rust
enum Result<T, E> {
    Ok(T),
    Err(E),
}
```

#### 方法定义中的枚举数据类型

```rust
struct Point<T> {
    x: T,
    y: T,
}

impl<T> Point<T> {
    fn x(&self) -> &T {
        &self.x
    }
}
```

> 注意必须在 `impl` 后面声明 `T`，这样就可以在 `Point` 上实现的方法中使用它了。

**结构体定义中的泛型类型参数并不总是与结构体方法签名中使用的泛型是同一类型**。

```rust
struct Point<T, U> {
    x: T,
    y: U,
}

impl<T, U> Point<T, U> {
    fn mixup<V, W>(self, other: Point<V, W>) -> Point<T, W> {
        Point {
            x: self.x,
            y: other.y,
        }
    }
}
```



> 注意泛型参数 `T` 和 `U` 声明于 `impl` 之后，因为他们于结构体定义相对应。而泛型参数 `V`和 `W` 声明于 `fn mixup` 之后，因为他们只是相对于方法本身的。



### 参考

+ [https://www.jianshu.com/p/64d54d39cffb](https://www.jianshu.com/p/64d54d39cffb)

