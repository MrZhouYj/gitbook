# cargo更改源

### 在 $HOME/.cargo/config 中添加如下内容：

如果没有config  自己新建一个

```rust
[source.crates-io]
replace-with = 'ustc'

[source.ustc]
registry = "https://mirrors.ustc.edu.cn/crates.io-index"

```

