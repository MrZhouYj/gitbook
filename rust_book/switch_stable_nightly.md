# rustup 切换stable、nightly

+ stable -> nightly

  ```
  C:\Users\rustr>rustc --version
  rustc 1.43.0 (4fb7144ed 2020-04-20)
  
  C:\Users\rustr>rustup override set nightly
  info: using existing install for 'nightly-x86_64-apple-darwin'
  info: override toolchain for '/Users/zhouyongjian' set to 'nightly-x86_64-apple-darwin'
  
    nightly-x86_64-apple-darwin unchanged - rustc 1.44.0-nightly (b2e36e6c2 2020-04-22)
  
  C:\Users\rustr>rustc --version
  rustc 1.44.0-nightly (b2e36e6c2 2020-04-22)
  ```

  

+ Nightly -> stable

  ```
  C:\Users\rustr>rustc --version
  rustc 1.44.0-nightly (b2e36e6c2 2020-04-22)
  
  C:\Users\rustr>rustup override set stable
  info: using existing install for 'stable-x86_64-apple-darwin'
  info: override toolchain for '/Users/zhouyongjian' set to 'stable-x86_64-apple-darwin'
  
    stable-x86_64-apple-darwin unchanged - rustc 1.43.0 (4fb7144ed 2020-04-20)
    
  C:\Users\rustr>rustc --version
  rustc 1.43.0 (4fb7144ed 2020-04-20)
  ```



+ 默认设置

  ```
  C:\Users\rustr> rustup default stable
  info: using existing install for 'stable-x86_64-apple-darwin'
  info: default toolchain set to 'stable-x86_64-apple-darwin'
  
    stable-x86_64-apple-darwin unchanged - rustc 1.43.0 (4fb7144ed 2020-04-20)
  
  ```

  