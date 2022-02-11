//async 表示这是一个异步方法,await必须再async方法中使用
//异步方法只能返回 void和Future
import 'dart:io';

//※将来开发 async和await 用到的可能特别多
//async 异步
// String readFile() async {//报错 需要返回Future或 不返回信息void
Future<String> readFile() async {
  //await 等待future执行完成再执行后续代码
  String content = await new File(r"D:\1.txt").readAsString();//去掉await 则会报错，因为readAsString是异步，不能返回string
  String content2 = await  new File(r"D:\1.txt").readAsString();
  //自动转换为 future
  return "$content和$content2";
}


void readFile2(void callback(s))  {
  String result;
  new File(r"D:\1.txt").readAsString().then((s){
    result = s;
    return new File(r"D:\1.txt").readAsString();
  }).then((s){
    result += s;
  }).whenComplete((){
    print(result);
    callback(result);
  });
}

void main(){

  //①async和await  执行完一个任务再执行下一个....
  // readFile().then((value){
  //   print('$value');
  // });

  //② then 实现
  readFile2((s) {
    print('用then实现获取结果:$s');
  });
}