
import 'dart:io';

void main(){

  //①
  // Stream<List<int>> stream = new File(r"D:\20210616评审内容.zip").openRead();
  // //两个订阅者会报错
  // var listen = stream.listen((s){
  //   print("stream");
  // });
  // //再追加一个订阅的话就报错了
  // // stream.listen((s){
  // //
  // // });


  //广播模式  : 可以多订阅  不会再出现异常
  Stream<List<int>> stream = new File(r"D:\20210616评审内容.zip").openRead();
  var broadcastStream = stream.asBroadcastStream();
  broadcastStream.listen((_){
    print("listen1");

  });
  broadcastStream.listen((_){
    print("listen2");
  });
 broadcastStream.listen((_){});
 broadcastStream.listen((_){});
 broadcastStream.listen((_){});

}
