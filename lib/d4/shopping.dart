/// 添加dart语法特性
/// 1. 使用语法糖，简化构造方法的赋值
/// 2. 使用初始化列表，简化构造方法的赋值
/// 3. 增加抽象类，提取公共部分
/// 4. 重写操作符，简化 price 求和
/// 5. 使用多行字符串优化 getInfo方法
/// 6. 对象初始化方式的优化
/// 7. 使用混入和级联运算符 优化代码

class Meta {
  String name;
  double price;

  Meta(this.name, this.price);
}

// 定义商品 Item 类
class Item extends Meta {
  Item(name, price) : super(name, price);

  Item operator +(Item item) => Item(name + item.name, price + item.price);
}

// 定义购物车类
class ShoppingCart extends Meta with PrintHelper {
  DateTime date;
  String code;
  List<Item> bookings;

  ShoppingCart({name, this.code})
      : date = DateTime.now(),
        super(name, 0);

  double get price =>
      bookings.reduce((value, element) => value + element).price;

  String getInfo() {
    return '''
购物车信息:
-----------------------------
用户名:$name
优惠码:${code ?? "没有"}
总价: ${price.toString()}
日期:${date.toString()}
-----------------------------
''';
  }
}

abstract class PrintHelper {
  printInfo() => print(getInfo());

  String getInfo();
}

void main() {
  ShoppingCart(name: '张三', code: '123123')
    ..bookings = [Item('苹果', 10.0), Item('荔枝', 20.0)]
    ..printInfo();

  ShoppingCart(name: '李四')
    ..bookings = [Item('橘子', 10.0), Item('开心果', 40.0)]
    ..printInfo();
}