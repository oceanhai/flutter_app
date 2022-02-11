import 'dart:io';
import 'dart:isolate';

int i;

void main() {
  //flutter 将来开发可能接触不到isolate

  //①
  // Isolate.spawn(entryPoint1, "hello");
  // print('entryPoint1异步睡觉，并不影响我执行');

  //②
  //dart中的isolate无法共享内存   内存隔离
  //因为dart没有共享内存的并发，没有竞争的可能性所以不需要锁，也就不用担心死锁的问题
  //输出结果 i=null
  // i = 100;
  // print("主isolate i=$i");
  // Isolate.spawn(entryPoint2, "hello");

  // ③消息接收器
  // 创建一个消息接收器
  // var receivePort = new ReceivePort();
  // //从消息接收器中读取消息
  // receivePort.listen((t) {
  //   print("监听到的结果：$t");
  // });
  // receivePort.sendPort.send(1);
  // receivePort.sendPort.send(2);
  // // receivePort.close();//进程 关闭 TODO 但这样再次run时候就不再有信息了， 后续消息驱动机制讲解

  // ④消息接收器
  // 创建一个消息接收器
  // var receivePort = new ReceivePort();
  // Isolate.spawn(entryPoint4, receivePort.sendPort);
  // //从消息接收器中读取消息
  // receivePort.listen((t) {
  //   print("监听到的结果：$t");
  // });

  //⑤
  // 创建一个消息接收器
  var receivePort = new ReceivePort();
  //将消息接收器当中的发送器 发给 子 isolate
  Isolate.spawn(entryPoint5, receivePort.sendPort);
  //从消息接收器中读取消息
  receivePort.listen((t) {
    //接收到了 子isolate 的 发送器
    if (t is SendPort) {
      print("接收到子isolate的SendPort");
      t.send("主isolate发送的消息");
    } else{
      print("监听到的结果：$t");
    }
  });

  //⑥+⑤
  //影响到receivePort 接收到消息
  sleep(Duration(seconds: 10));
}

void entryPoint1(String message){
  print('$message睡3秒开始');//打印日志
  sleep(Duration(seconds: 3));//睡一下，看是否会影响main后面的代码执行
  print('$message睡3秒结束');//TODO ？不打印日志
}

void entryPoint2(String message){
  print("子isolate i=$i");//i=null
  sleep(Duration(seconds: 3));
}

void entryPoint4(SendPort sendPort) {
  sendPort.send("我是子isolate发送的信息");
}

void entryPoint5(SendPort sendPort) {
  //创建一个消息接收器
  var receivePort = new ReceivePort();
  var sendPort2 = receivePort.sendPort;

  //把子isolate的发送器发送给主isolate
  sendPort.send(sendPort2);
  //给主isolate发送消息
  sendPort.send("子isolate发送的消息");

  //子isolate 监听消息
  receivePort.listen((t){
    print("子isolate监听到的结果：$t");
  });

}

