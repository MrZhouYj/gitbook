# 链接mysql数据库



1. 首先安装diesel_cli: cargo install diesel_cli 

2. echo DATABASE_URL=mysql://username:password@localhost/databasename > .env

3. diesel setup    // 没有数据库的话，会自动创建数据库

4. 接下来我们创建一个articles表 存储文章

```ruby
diesel migration generate create_articles
```

 生成了两个迁移文件

Creating migrations/2020-05-02-160943_create_articles/up.sql

```mysql
CREATE TABLE articles (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  content TEXT NOT NULL,
  create_at DATATIME NOT NULL
)
```

Creating migrations/2020-05-02-160943_create_articles/down.sql

```mysql
DROP TABLE articles
```

5.  diesel migration run

   diesel migration revert (回滚)

   diesel migration redo(重新run)

***

mysql 常见的sql操作

**删除列**

alter table table-name drop col-name;

**增加列(单列)**

alter table table-name add col-name col-type comment 'xxx';

**增加列(多列)**

alter table table-name add col-name col-type comment 'xxx', add col-name col-type(col-length) comment 'xxx';

**增加表字段并指明字段放置为第一列**

alter table table-name add col-name col-type COMMENT 'sss' FIRST;

**增加表字段并指明字段放置为特定列后面**

alter table table-name add col-name col-type after col-name-1;

**使用MODIFY修改字段类型**

alter table table-name modify column col-name col-type;

**使用CHANGE修改字段类型**

alter table table-name change col-name col-name col-type;

**使用CHANGE修改字段名称**

alter table table-name change old-col-name new-col-name col-type;

**修改列类型、长度**

alter table table-name change old-col-name new-col-name new-col-type;



**查看表中列属性**

show columns from table-name;

**修改表名**

rename table old-table-name to new-table-name;

**为字段设置NULL和DEFAULT**

alter table table-name modify col-name col-type not null default 100;

**修改字段的默认值**

alter table table-name alter col-name set default 10000;

**字段删除默认值** 

alter table table-name alter col-name drop default;

