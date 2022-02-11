
void main(){
  // int i;
  // String j;
  // print(i);

  // Object i = "wuhai";
  // var j = "wuhai";
  // j = 100;//不可以再赋值int型

  // var 声明的变量在赋值的那一刻，决定了它是什么类型。
  // var j;//object类型
  // j="wuhai";
  // j=100;

  //dynamic： 不是在编译时候确定实际类型的, 而是在运行时。dynamic声明的变量行为与Object一样
  // dynamic z = "wuhai";
  // z = 100;

  //final是运行时常量，而const是编译器常量，const性能更高
  //跟java理解一样
  final i = 1;
  // i =2;//不能再次赋值
  const j = 1;
  // j = 2;//不能再次赋值
  final z = j;//可以
  // const x = i;//不可以

}