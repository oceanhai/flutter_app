/// 添加dart语法特性
/// 1. 使用语法糖，简化构造方法的赋值
/// 2. 使用初始化列表，简化构造方法的赋值
/// 3. 增加抽象类，提取公共部分
/// 4. 重写操作符，简化 price 求和
/// 5. 使用多行字符串优化 getInfo方法
/// 6. 对象初始化方式的优化
/// 7. 使用混入和级联运算符 优化代码

/// 3.增加抽象类，提取公共部分,Item 和ShoppingCart 继承该类
class Meta {
  String name;
  double price;

  Meta(this.name, this.price);
}

// 定义商品 Item 类
class Item extends Meta {
  ///3
  // double price;
  // String name;

  /// 1. 使用语法糖简化赋值过程
  // Item(this.name, this.price);

  /// 3.
  Item(name, price) : super(name, price);

  /// 4.operator 与 + 中间可以没有空格
  Item operator +(Item item) => Item(name + item.name, price + item.price);
}

// 定义购物车类
class ShoppingCart extends Meta with PrintHelper {
  ///3
  // String name;
  DateTime date;
  String code;
  List<Item> bookings;

  /// 2. 语法糖 + 初始化列表
  /// 3.super 必须放在 初始化列表的后面
  /// The superclass call must be last in an initializer list: 'super(name, 0)'.
  // ShoppingCart(name, this.code)
  //     : date = DateTime.now(),
  //       super(name, 0);

  /// 6
  ShoppingCart({name, this.code})
      : date = DateTime.now(),
        super(name, 0);

  /// 3.Class 'ShoppingCart' can't define method 'price' and have field 'Meta.price' with the same name.
  /// 改成 get 形式
  // double get price {
  //   double sum = 0.0;
  //   for (var i in bookings) {
  //     sum += i.price;
  //   }
  //   return sum;
  // }
  /// 4.reduce:依次访问List中所有的元素，并将List中所有的元素根据传入的函数压缩成一个数值。
  /// 例如：首先传入List中的1，2两个元素给value和element，相加后的结果作为参数传给value，第3个元素传给element，依此类推
  double get price =>
      bookings.reduce((value, element) => value + element).price;

  /// 3. name 不能为空，继承Meta后，记得注释name属性，报错：Invalid argument(s)  _StringBase.+ (dart:core-patch/string_patch.dart:272:57)
  /// 5. 使用多行字符串优化 getInfo方法
  /// 6. code 判空处理，?? 相当于三目运算 ?:
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
    // return '购物车信息:' +
    //     '\n-----------------------------' +
    //     '\n 用户名: ' +
    //     name +
    //     '\n 优惠码: ' +
    //     code +
    //     '\n 总价: ' +
    //     price.toString() +
    //     '\n 日期: ' +
    //     date.toString() +
    //     '\n-----------------------------';
  }

}

/// 7.使用混入with
abstract class PrintHelper {
  // 提供打印方法，方便使用级联运算符
  printInfo() => print(getInfo());

  String getInfo();
}

void main() {
  // ShoppingCart sc1 = ShoppingCart(name:'张三', code:'123123');
  // sc1.bookings = [Item('苹果', 10.0), Item('荔枝', 20.0)];
  // print(sc1.getInfo());
  //
  // ShoppingCart sc2 = ShoppingCart(name:'李四');
  // sc2.bookings = [Item('橘子', 10.0), Item('开心果', 40.0)];
  // print(sc2.getInfo());
  /// 7.级联运算符
  ShoppingCart(name: '张三', code: '123123')
    ..bookings = [Item('苹果', 10.0), Item('荔枝', 20.0)]
    ..printInfo();

  ShoppingCart(name: '李四')
    ..bookings = [Item('橘子', 10.0), Item('开心果', 40.0)]
    ..printInfo();
}