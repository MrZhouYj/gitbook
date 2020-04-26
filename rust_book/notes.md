# Rust 格式化

###  示例代码

```rust
use std::fmt; //这里需要有分号
//定义一个接口 声明方法
trait Area {
    fn get_count (&self) -> f64; //这里需要有分号
}

#[derive(Debug)] // 开启debug 需要写在 struct 上面  
struct Fruit {
    count: f64  // 声明属性
}
// 实现上面 定义的方法  
impl Area for Fruit {
    fn get_count(&self) -> f64 {
        self.count + 1.0 // 作为返回值 这里不需要有分号
    }
}

impl fmt::Display for Fruit {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f,"count为{}",self.count)
    }
}

fn main() {
    //这里也需要分号🙃
   let f = Fruit {count: 200.0};
   println! ("count= {:?}", f.count);
   println! ("count2= {:?}", f.get_count());
   println! ("count={:?}", f);
   println! ("{}", f);
}

```

### rust格式化

+ `fmt::Debug`: Uses the `{:?}` marker. Format text for debugging purposes. 如果我们的占位符使用{:?}，默认会调用对象的Debug方法，如果没有，则会报告错误
+ `fmt::Display`: Uses the `{}` marker. Format text in a more elegant, user friendly fashion.如果我们的占位符使用{},，默认会调用对象的Display方法，如果没有，则会报告错误

注意，除了这两种形式，还有其他一些格式化输出方式

```
 *unspecified* -> `Display`
 `?` -> `Debug`
 `o` –> `Octal //8进制`
 `x` –> `LowerHex //16进制`
 `X` -> `UpperHex`
 `p` –> `Pointer `
 `b` –> `Binary //二进制`
 `e` -> `LowerExp`
 `E` -> `UpperExp`
```

#### 实现debug

在Rust语言中实现Debug有两种方式，一种就是用推导#[derive(Debug)]，另一种就是类似Display的impl方式。

先看推导，就是在struct上面加上#[derive(Debug)]

```rust
#[derive(Debug)] // 开启debug 需要写在 struct 上面
struct Fruit {
    count: f64
}
```



使用#[derive(Debug)]方式输出的结果样式是固定的，当需要换个花样来显示的时候，就要用到第二种方式impl fmt::Debug

```rust
impl fmt::Debug for Fruit {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f,"count为{}",self.count)
    }
}
```

