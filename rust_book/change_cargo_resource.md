# cargo更改源  

### 在 $HOME/.cargo/config 中添加如下内容：

如果没有config  自己新建一个

```rust
[source.crates-io]
replace-with = 'ustc'

[source.ustc]
registry = "https://mirrors.ustc.edu.cn/crates.io-index"

```



## rustfmt

```
rustup compoent add rustfmt
```

## cargo fix

从1.29版本开始，cargo自带子命令`cargo fix`,用以帮助开发者自动修复编译器中有警告的代码。