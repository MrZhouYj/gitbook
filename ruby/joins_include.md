# joins 和 include

includes和joins的不同 
当includes和joins的时候最重要的概念就是他们有他们的典型用例。 
includes使用贪婪加载（eager loading）而joins使用懒加载（lazy loading），两者都非常有用，但是也都很容易被滥用导致程序性能降低或过度使用。 
如果我们看一眼ruby on rails文档，描述includes最重要的一句话是：

> 使用includes，Active Record确保使用最少的查询加载所有指定的连接。

换句话说，当我们的查询需要一个关联表时，两者（我们要查的表和关联表）都会被加载到内存中，这反过来在检索关联数据时会减少查询的次数。下边例子中我们检索companies表中所有关联person表的记录。

```rub
@companies = Company.includes(:persons).where(:persons => { active: true } ).all

@companies.each do |company|
     company.person.name
end
```

当我们迭代每个companies表中记录并且显示其对应person名字时，通常情况下，我们不得不每次使用单独的查询来检索person的名字。然而当我们使用includes方法时，渴望加载会把这关联的两个表加载到内存，所以这些代码只需要以此查询。很棒，对吧？ 
所以当我们想检索所有关联person的companies数据，但是不想显示Person表中数据的时候，使用includes会发生什么呢？这时候加载关联的表就没有必要了，这时joins就开始闪光了！

```ruby
@companies = Company.joins(:persons).where(:persons => { active: true } ).all


@companies.each do |company| 
     company.name 
end
```

joins方法使用懒加载（lazy loading）方式加载数据库，它只把Company表加载到内存，与Company表关联的Person表并不做要求（不加载到内存）。因此我们呢不会将冗余数据加载到内存中，虽然如果以后我们需要从同一数组变量使用Person表的数据，需要进一步的数据查询。