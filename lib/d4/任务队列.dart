import 'dart:io';
import 'dart:isolate';

void main(){
  // //①
  // var receivePort = new ReceivePort();
  // receivePort.listen((t){
  //   print(t);
  // });
  // //普通任务
  // receivePort.sendPort.send("发送消息给消息接收器1!");
  // //开启一个微任务
  // Future.microtask((){
  //   print("微任务执行1");
  //   //③ 后续任务需要等待，说明dart是单线程
  //   // sleep(Duration(seconds: 10));
  // });
  //
  // //②微任务队列优先级最高
  // //普通任务
  // receivePort.sendPort.send("发送消息给消息接收器2!");
  // //开启一个微任务
  // Future.microtask((){
  //   print("微任务执行2");
  // });
  // //普通任务
  // receivePort.sendPort.send("发送消息给消息接收器3!");
  // //开启一个微任务
  // Future.microtask((){
  //   print("微任务执行3");
  // });

  //④微任务队列会不会插队？会
  var receivePort = new ReceivePort();
  receivePort.listen((t){
    print(t);
    //开启一个微任务
    Future.microtask((){
      print("微任务执行1");
    });
  });
  receivePort.sendPort.send("发送消息给消息接收器1!");
  receivePort.sendPort.send("发送消息给消息接收器2!");
  receivePort.sendPort.send("发送消息给消息接收器3!");

  //⑤任务队列的执行是在main方法执行完后  ④+⑤
  sleep(Duration(seconds: 10));
}