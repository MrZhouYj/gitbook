# rust项目结构

`lib.rs` 文件 **用于指定 库 `crate` 有哪些公开的模块可用**。

+ [Rust 中包访问策略和module开发策略](https://blog.csdn.net/teamlet/article/details/50917512)

lib.rs 文件

```rust
pub mod mod1; //Rust会查找 src/mod1.rs 或者 src/mod1/mod.rs 
```

```
find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'  // 实现tree效果

brew install tree // 安装tree 查看目录结构
```

### mod用法示例

项目目录：

```rust
.
|____Cargo.toml
|____Cargo.lock
|____src
| |____lib.rs
| |____main.rs
| |____test_mod.rs
```

 src/test_mod.rs

```rust
pub fn say(){
   println!("你好")
}
```

src/main.rs

```rust
extern crate demo;
use demo::test_mod::say;
fn main(){
   say();
}
```

src/lib.rs

```rust
pub mod test_mod;
```

