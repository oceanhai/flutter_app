
void test0(){
  throw new Exception("抛出异常");
}

void test() {
  throw "你太帅了，不给你调用!";
  // throw 11;

}


int test1(int i){
  if(i == 0){
    throw "1";
  } else if(i == 1){
    throw print;

  }
  return 3;
}

void main(){

  // test0();

  try{
    test0();
  }
  // catch(Exception e){//区别 报错
  //
  // }
  catch(e){//一个参数 e: 就是抛出的异常对象
    print("test0()-e-runtimeType:${e.runtimeType}");
    print("test0()-e:$e");
  }

  //介绍catch的参数
  try {//dart 支持
    test();
  }catch(e,s){
    //e: 就是抛出的异常对象
   print("test()-e-runtimeType:${e.runtimeType}");
   print("test()-e:$e");
    //s: StackTrace 调用栈信息
   print("test()-s-runtimeType:${s.runtimeType}");
   print("test()-s:$s");
  }
  print("-------------------------------------");

  //根据不同的异常类型 进行不同的处理
  // on TYPE catch....  TODO 相当于java catch(Exception e)
  try {
    test();
  } on Exception  catch(e,s){
    print("on TYPE catch : Exception,$e");
  } on int catch(e){
    print("on TYPE catch : int,$e");
  } on String catch(e){
    print("on TYPE catch : String,$e");
  }
  print("-------------------------------------");

  try{
    int r = test1(1);
    if(r == 1){
      //......
    }
  // } on print catch(e){// 方法  print是个方法，而不是对象所以报错
  } on Function catch(e){// 方法
    e("抛出异常，对象是个方法，使用这个方法:${e.runtimeType}");//我们再调用方法 TODO 骚操作
    //.......
  } on String catch(e){
    print("String");
    //......
  } finally{

  }

  //结束语 一切皆可抛
}