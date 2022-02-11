//被mixin(混入)的类不能有构造函数
class A  {

  //构造方法
  // A();

  void a(){
    print("A  的a方法!");
  }

}
class B{
  void b(){
    print("B  的b方法");
  }
  void a(){
    print("B  的a方法!");
  }
}


// 满足了我们的多继承的需求
//java是单继承，dart混入实现多继承效果
class C with  B,A{

  void c(){
    print("C  的c方法!");
  }

  // 重写了 混入类的a方法
  //@override 可以省略
  // 可以super，遵循混入优先级规则
  // @override
  void a(){
    // super.a();
    // super.b();
    print("C  的a方法!");
  }
}

class D extends A{
  @override
  a();
}

//E 就是A B的混合类
//E类没有自己的方法
class E = Object with A, B;


void main(){

  //被mixin(混入)的类不能有构造函数
  //A类如果有构造方法，C混入AB报错
  new A();//还是可以的

  //1、自身是第一优先级
  //2、如果自身没有对应的方法，就从with最右边开始查找方法
  var c = new C();
  c.c();
  c.a();

  print('----------------------------------------');
  //E 就是A B的混合类
  //遵循 混入优先级规则
  var e = new E();
  e.a();
  e.b();

}