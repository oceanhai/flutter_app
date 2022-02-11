
class Point{
  //每一个实例属性 变量都会有一个隐式的 get，非final 还有 set
  int a;
  int b;
  //a 是方法名
  // int get a => 10;//TODO 报错 已经存在隐式get方法

  //一般定以成私有属性
  int _x;
  int _y;

  //TODO x是方法名  箭头符号
  int get x => _x;
  //{}形式
  // int get x {
  //   return _x;
  // }
  //set方法
  set x(int x) => _x = x;


  //运算符重载， 定义+ 操作的行为   ：operator 操作符
  Point operator +(Point other){
    var point = new Point();
    point._x = _x + other.x;
    return point;
  }

  //运算符重载  dart更加灵活
  String operator -(int x){
   return "$_x-$x=${_x-x}";
  }


}

//抽象类
abstract class Parent{
  String name;
  void printName();//抽象方法，不需要在方法前面声明 abstract
  void printName2(){

  }
}

//与Java不同，Dart中没有`interface`关键字，**Dart中每个类都隐式的定义了一个包含所有实例成员的接口**，
// 并且这个类实现了这个接口。如果你想 创建类 A 来支持 类 B 的 方法，而不想继承 B 的实现， 则类 A 应该实现 B 的接口。
//TODO 每一个类都可以看做一个接口
class A{
  void a(){}
}
// class MyInt implements int{
class MyInt implements A{
  @override
  void a() {
  }
}
class MyA extends A{

}


//可调用类
//如果 Dart 类实现了 call() 函数则 可以当做方法来调用。
class Test{
  void ass(){}

  void  fff(){}

  // call(String a, String b) => '$a $b!';
  void call(String a, String b){
    print('$a $b!');
  }
}


void main(){

  ///Getter 和 Setter
  //TODO 这点是跟kotlin一样的
 var point = new Point();
 //  get
 print('a=${point.a}');
 // set
 point.a = 5;
 point.b = 10;
 print('a=${point.a},b=${point.b}');
 print("-------------------------------------");

 //私有属性
 //  get
 print('x=${point.x}');
 // set
 point.x = 3;
 print('x=${point.x}');
 print("-------------------------------------");

 ///操作符重载
 var p1 = Point();
 var p2 = Point();
 p1.x = 10;
 p2.x = 20;
 //java 中不允许
 //dart支持
 var p3= p1 + p2;
 print('p3.x-1=${p3.x}');
 p3 = p1 + p2 + p3;
 print('p3.x-2=${p3.x}');
 //更加灵活......
 String str = p3 - 1;
 print('str:$str');
 print("-------------------------------------");

 ///抽象类与接口


 ///可调用类
 Test test = Test();
 test("Hello","Dart");
}

