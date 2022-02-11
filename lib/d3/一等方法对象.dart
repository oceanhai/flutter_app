
import 'package:flutter_app/d3/%E5%8F%AF%E9%80%89%E5%8F%82%E6%95%B0.dart';

void fun0(){
  print('fun0');
}

void fun(Function f){ //没有办法表示要传递的这个方法参数 这个方法需要什么参数，返回什么
  f(1);
}
//这种写法 可以表达 我这个方法接受的方法参数f1 需要什么类型的变量返回什么
//但是写起来很麻烦 所以用typedef
void fun3(void f1(int i,int j) ){

}


//定义一个类型： F 类型， 这个F类型其实就是一个方法，接受两个int参数，返回void
//typedef 指定必须满足参数类型
typedef String F(int i,int j);

String fun2(F f){
  return f(1, 1);//TODO 如果去掉一个参数，会提示错误
}

void main(){

  //想java一样调用方法
  fun0();

  //方法都是对象，可以赋值给Function变量
  Function f0 = fun0;
  f0();

  //
  Function f = fun;
  // f();//运行报错 未传参数
  // f((){});//运行报错 无参
  f((int i){
    print('单个参数 int =$i');
  });//正确

  // 方法都是对象，可以赋值给Function变量
  Function f2 = fun2;
  //匿名方法， lambda表达式， closure闭包
   f2((int i,int j){
    return "$i+$j=";
   });

  //  fun2((int i,int j){ return "1";});
}


/**
 * Java中使用接口作为回调接口
 */
class OnClickListener{
  void onClick(){}
}

class Button{
  void setOnClickListener(OnClickListener listner){

  }
}


/**
 * Dart中可以直接使用回调方法
 */
typedef void onClick();

class Button1{

  void setOnClickListener(onClick listener){
    listener();
  }
}