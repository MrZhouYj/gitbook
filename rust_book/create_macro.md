# 定义一个宏

定义一个宏

```rust
macro_rules! mymacro {
       () =>{}
}
```



+ 创建一个新文件 testMacro.rs

  ```rust
  macro_rules! hello{
     () => {
        println!("hello")
     }
  }
  ```

  

+ 使用

  ```rust
  #[macro_use]
  pub mod testMacro;
  fn main(){
      hello!();
  }
  ```

  