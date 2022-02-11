
import 'dart:async';
import 'dart:io';

void main(){

  //广播模式  类似 Android 的eventbus

  //①单订阅  没问题
  // var stream = Stream.fromIterable([1,2,3,4]);
  // stream.listen((event) {
  //   print('$event');
  // });

  //②广播模式  单订阅转换而来 没问题
  // var stream = Stream.fromIterable([1,2,3,4]);
  // //由单订阅转换而来的  ： 和单订阅唯一的区别就是 允许多订阅
  // var broadcastStream = stream.asBroadcastStream();
  // broadcastStream.listen((i){
  //   print("订阅者1：$i");
  // });
  // broadcastStream.listen((i){
  //   print("订阅者2：$i");
  // });

  //===========================
  //③ 直接创建广播
  //直接创建一个广播  StreamController流管理器
  var streamController = StreamController.broadcast();
  //能获得到数据
  streamController.stream.listen((i){
    print("发送前监听到广播:"+i);
  });
  //发送一条广播
  streamController.add("1");
  //不能获得数据    先发送再监听肯定是监听不到的
  streamController.stream.listen((i){
    print("发送后监听到广播:"+i);
  });
  streamController.close();

  //============================
  //④ 需要放开②的代码，也是可以监听到广播的
  // broadcastStream.listen((i){
  //   print("转换的广播：$i");
  // });

}
