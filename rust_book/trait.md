# trait简介

https://zhuanlan.zhihu.com/p/21568827

[Lifetime到底在解决啥问题](https://www.jianshu.com/p/c186f67a0cf2)



### ::用法

+ 调用struct 的关联函数

+ 调用模块创建的命名空间

+ 调用枚举

  ```rust
  enum Option<T> {
     Some(T),
     None
  }
  Option::None
  ```

  

静态函数：

关联函数：不 以 `self` 作为参数的函数

**方法语法**：方法语法获取一个实例并加上一个点号，后跟方法名、圆括号以及任何参数。

