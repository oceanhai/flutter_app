
//平时
void funN(int i, int j){
  print("i=$i");
  print("j=$j");
  print('funN--------------------');
}

//可选位置参数 []
void fun0([int i, int j]){
  print("i=$i");
  print("j=$j");
  print('fun0--------------------');
}

//可选位置参数 默认值
void fun([int i = 1,int j = 2]){
  print("i=$i");
  print("j=$j");
  print('fun--------------------');
}


//可选命名参数 {}
void fun1({int i = 1,int j = 2}){
  print("i=$i");
  print("j=$j");
  print('fun1--------------------');
}
//都可以设置默认参数值

void main(){
  funN(1, 10);
  // funN(1);//报错 期望2个位置参数，但找到1个。

  //允许 只传一个参数
  fun0(10);
  fun0(1,2);

  //如果想给j传值，就必须保证要给i传值， 因为 位置！！！！
  fun(0);
  fun(10,1);

  fun1();//可以不传参
  // fun1(10);//错误 必须以键值对指明参数
  fun1(j:10);
  fun1(j:10,i:11);//顺序可以颠倒

  //TODO 优点 不需要再像java一样，写一大堆的重载函数，并且能够提供参数默认值。
}

