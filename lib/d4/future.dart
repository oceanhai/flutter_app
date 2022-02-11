

import 'dart:io';

void main(){

  //future 除了microtask是微任务，其他方法都是普通任务

  //①
  // //工厂构造方法
  // //执行本任务时候，延迟3秒后执行   ※而不是调用此代码后3秒执行，因为可能main有sleep或者有其他微任务
  // Future f = Future.delayed(Duration(seconds: 3));
  // // future的执行记过 通过then可以获取
  // f.then((t){
  //   print(t);
  // });

  //②
  //r"D:\1.txt" 等价于 "D:\\1.txt"
  // new File(r"D:\1.txt").readAsString().then((String s){
  //   print(s);
  // });

  //③ 无此文件 抛异常
  // new File(r"D:\11.txt").readAsString().then((String s){
  //   print(s);
  // });

  //④
  // new File(r"D:\1.txt").readAsString().then((String s){
  //   print(s);
  // }).catchError((e,s){
  //
  // });

  //⑤
  // new File(r"D:\1.txt").readAsString().then((String s){
  //   print('----------------------');
  //   //返回void 或者Future
  //   print(s);
  //   return 1;
  // }).//获取返回值
  // then((value) => print('返回值：$value'));

  //⑥ 我们把⑤拆开来看
  // Future<String> then = new File(r"D:\1.txt").readAsString().then((String s){
  //   print('----------------------');
  //   //返回void 或者Future
  //   print(s);
  //   return"你好";
  // });
  // then.then((value) => print('返回值：$value'));

  //④⑤⑥  5和6的执行先顺序不是固定的
  //TODO 返回void 从代码中怎么看出来是可以的呢？

  //⑦wait
  //通过then可以完成 有序任务的执行，一个任务执行完成之后，下一个任务根据上个任务的结果 执行不同的操作
  //如果需要一组任务都执行完毕之后 再统一执行相同的一些处理
  // Future.wait([Future.delayed(Duration(seconds: 5)),
  //   Future.delayed(Duration(seconds: 1)),
  //   Future.microtask((){
  //     for(int x=0;x<10;x++){
  //       print('$x');
  //     }
  //   })]).
  // then((_){
  //   print("then结果：1");
  // });

  //⑧forEach
  //这个跟android rxjava类似
  Future.forEach([1,2,3,4],(i){
    print('forEach:$i');
  });

}
