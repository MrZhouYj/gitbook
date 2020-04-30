# 操作Redis

```rust
extern crate diesel_demo;
#[macro_use] extern crate redis_async;
use actix::prelude::*;
use actix_web::{Error as AWError};
use actix_redis::{Command, RedisActor};
use redis_async::resp::RespValue;


async fn set(redis: web::Data<Addr<RedisActor>>) -> Result<HttpResponse, AWError> {
    let result=redis.send(Command(resp_array!["set","name","myvalue"])).await?;
    match result {
        Ok(RespValue::SimpleString(s)) if s == "OK" => {
            Ok(HttpResponse::Ok().body("Set values success!"))
        }
        _ => {
            println!("---->{:?}", result);
            Ok(HttpResponse::InternalServerError().finish())
        }
    }
}

async fn get(redis:web::Data<Addr<RedisActor>>)-> Result<HttpResponse, AWError> {
    let result=redis.send(Command(resp_array!["get","name"])).await?;
    match result{
        Ok(RespValue::BulkString(s)) =>{
            Ok(HttpResponse::Ok().body(s))
        }
        _ => {
            println!("---->{:?}", result);
            Ok(HttpResponse::InternalServerError().finish())
        }
    }

}
#[actix_rt::main]
async fn main() -> io::Result<()> {

    env::set_var("RUST_LOG", "actix_web=debug,actix_server=info");
    env_logger::init();

    HttpServer::new( move || {
        let redis_addr = RedisActor::start("127.0.0.1:6379");
        App::new()
            .data(redis_addr)
            .wrap(middleware::Logger::default())
            .route("/set",web::get().to(set))
            .route("/get",web::get().to(get))
            .service(
                web::resource("/").route(
                    web::get().to(|req: HttpRequest| {
                        HttpResponse::Ok().json(json!({
                            "state": "success"
                        }))
                    })
                )
            )
     })
    .bind("127.0.0.1:8080")?
    .run()
    .await
}
```

