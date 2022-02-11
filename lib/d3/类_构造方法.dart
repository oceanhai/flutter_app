






import 'package:flutter_app/d3/point.dart';

import 'point0.dart';
import 'point1.dart';

///dart 没有作用域
void main(){

  //所有属性暴露给外部
  var point0 = new Point0();
  print(point0.x);
  print(point0.y);
  print("-------------------------------------");

  //私有属性
  var point1 = new Point1();
  // print(point1.x);//报错
  print(point1.y);
  print("-------------------------------------");

  //私有类
  // var point2 = new _Point2();//报错

  //可选命名参数 {}
  // var point = new Point();
  // var point = new Point(10);//错误 必须以键值对指明参数
  // var point = new Point(y:10);//对 必须以键值对指明参数 point.dart里的Point({this.y})注释释放开
  // print(point.y);
  // print("-------------------------------------");

  ///非要使用重载呢？   类名.X() 命名构造方法
  var point = new Point.Cool(1);
  print('命名构造方法 y= ${point.y}');
  //TODO 既然构造方法，可以使用 可选命名参数 {},那为什么又需要 命名构造方法呢？
  //TODO 1、通过命名，来明确方法里要做些什么 2、方法里内容的差异
  print("-------------------------------------");

  //参数初始化列表  TODO 好像kotlin也可以这样初始化
  var pointXY = new Point.XY();
  // print('pointXY x=${pointXY.x} y=${pointXY.y}');//TODO 有问题吗？
  print('pointXY y=${pointXY.y}');
  Map<String,int> map = {'x':3,'y':4};
  var pointMap = new Point.fromMap(map);
  // var pointMap = new Point.fromMap({'x':3,'y':4});//TODO 有问题吗？
  print('pointMap y=${pointMap.y}');
  print("-------------------------------------");

  ///常量构造函数
  //使用  new 来创建 常量构造方法的 对象 就和普通的对象没有区别
  var p01 = new ImmutabelPoint(1,1);
  var p02 = new ImmutabelPoint(1,1);
  print('p01.hashCode == p02.hashCode:${p01.hashCode == p02.hashCode}');
  print('p01 == p02:${p01 == p02}');
  //使用const 来创建多个对象，传递参数一样 表示 这几个对象是同一个 编译期常量 对象 （必须定义常量构造函数）
  var p1 = const ImmutabelPoint(1,1);
  var p2 = const ImmutabelPoint(1,1);
  print('p1.hashCode == p2.hashCode:${p1.hashCode == p2.hashCode}');
  print('p1 == p2:${p1 == p2}');
  var p3 = const ImmutabelPoint(1,1);
  var p4 = const ImmutabelPoint(1,2);
  print('p3.hashCode == p4.hashCode:${p3.hashCode == p4.hashCode}');
  print('p3 == p4:${p3 == p4}');
  //TODO 应用场景 flutter里 布局 const Text(XXX),如果多处出现，创建的对象只占一份的内存， 感觉有一丢丢鸡肋
  print("-------------------------------------");

  ///工厂构造函数  factory关键字
  Manager manager = new Manager.getInstance();
  print('manager.i=${manager.i}');
  // new Manager();//TODO 报错吗？
  // new Manager._newInstance();//TODO 报错吗？
  print("-------------------------------------");

}
