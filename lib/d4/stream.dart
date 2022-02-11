
import 'dart:io';

void main(){
  /**
   *  Future 表示稍后获得的一个数据，所有异步的操作的返回值都用 Future 来表示。但是 Future
   * 只能表示一次异步获得的数据。而 Stream 表示多次异步获得的数据。比如 IO 处理的时候，
   * 每次只会读取一部分数据和一次性读取整个文件的内容相比，Stream 的好处是处理过程中内存占用较小。
   * 而 File 的 readAsString()是一次性读取整个文件的内容进来，虽然获得完整内容处理起来比较方便，
   * 但是如果文件很大的话就会导致内存占用过大的问题。
   */

  //①
  // Stream<List<int>> stream = new File(r"D:\20210616评审内容.zip").openRead();
  // var listen = stream.listen((event) {
  //   print('1');//执行多次
  // });
  // new File(r"D:\20210616评审内容.zip").readAsBytes().then((_){
  //   print("future");//执行一次
  // });

  //②
  // //替代掉listen的方法
  // listen.onData((s){
  //   print("strema2");
  // });
  // listen.onDone((){
  //   print("读完整个文件");
  // });
  // listen.pause();//暂停
  // // listen.resume();//恢复 先暂停再恢复

  //③ 写1
  //写这个文件
  // var dst = new File(r"D:\20210616评审内容1.zip");
  // Stream<List<int>> stream = new File(r"D:\20210616评审内容.zip").openRead();
  // var listen = stream.listen((s){
  //   print("stream");
  //   dst.writeAsBytes(s);//覆盖写，所以大小不对
  //   // dst.writeAsBytes(s, mode: FileMode.append);//追加模式，大小依然不对
  // });

  //④ 写2
  // var dst = new File(r"D:\20210616评审内容1.zip");
  // var write = dst.openWrite();
  // Stream<List<int>> stream = new File(r"D:\20210616评审内容.zip").openRead();
  // write.addStream(stream);

  //④ 写2
  var dst = new File(r"D:\20210616评审内容1.zip");
  var write = dst.openWrite();
  Stream<List<int>> stream = new File(r"D:\20210616评审内容.zip").openRead();
  var listen = stream.listen((s){
    print("stream");
    write.add(s);
  });

}
