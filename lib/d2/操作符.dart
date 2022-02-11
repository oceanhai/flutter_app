

void main() {
  /**
   * 类型判断操作符
   */
  // num j = (int)1;
  num j = 1;
  //类型转换 不支持 java的： (int)强转写法
  int i = j as int;

  Object i1 = 1;//int
  //没有java的 instantof ，需要使用is
  // if(i1 instanceof int){}
  if (i1 is int) {
    print('i1 是 int');
  }
  //不属于int类型则命中if
  // if(!(i1 instanceof int)){}
  if (i1 is! int) {
    print('i1 不是 int');
  }

  /**
   * 赋值操作符
   */
  String k;

  //java保证k后续使用一定不为null
  if (null == k) {
    k = "123";
  }

  //??= 安全赋值，如果k有值，这句话就当他不存在。如果没值就赋值456
  //TODO kotlin "?"加在变量后，系统在任何情况不会报它的空指针异常，"!!"加在变量后，如果对象为null,那么系统一定会异常！
  k ??= "456";
  print("k=$k");

  /**
   * 条件表达式
   */
  //1、三目表达式
  var num1 = k == "123" ? 0 : 1;
  print('num1=$num1');
  //2、expr1 ?? expr2 如果 expr1 不为null，返回其值； 否则执行 expr2 并返回其结果。
  k = null;
  var v = k ?? "789";
  print("??表达式，v=$v");

  /**
   * 级联操作符 ..
   */
  new Builder()
    ..a()
    ..b();

  /**
   *  安全操作符 TODO 跟kotlin一样
   */
  String str;
  //如果str为null，就返回null
  print(str?.length);
}

class Builder {
  void a() {
    print('Builder a()');
  }

  void b() {
    print('Builder b()');
  }
}
