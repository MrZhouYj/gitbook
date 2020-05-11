# rust trait bound

https://blog.csdn.net/readlnh/article/details/87276321



fn print_type_of<T>(_: &T) {
    println!("{}",  std::any::type_name::<T>() );
}

>  as_ptr() 打印变量地址

fn main() {
    print_type_of(&32.90);          // prints "f64"
    print_type_of(&vec![1, 2, 4]);  // prints "std::vec::Vec<i32>"
    print_type_of(&"foo");          // prints "&str"
}

