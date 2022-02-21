import 'package:dio/dio.dart';


// void main() {
//   var dio = new Dio();
//   dio.get("https://www.wanandroid.com/banner/json").then((value){
//
//   });
// }

void main() async{

  //dio 网络请求框架
  var dio = new Dio();
  Response response = await dio.get("https://www.wanandroid.com/banner/json");
  print('response.data:${response.data}');
  print('response.headers:${response.headers}');
  print('response.request:${response.request}');
  print('response.isRedirect:${response.isRedirect}');
  print('response.statusCode:${response.statusCode}');
  print('response.statusMessage:${response.statusMessage}');
  print('response.redirects:${response.redirects}');
  print('response.extra:${response.extra}');

  //map:转换 ,将List中的每一个条目执行 map方法参数接收的这个方法,这个方法返回T类型，
  //map方法最终会返回一个  Iterable<T>
  var list = [1,2,3,4];
  Iterable<String> list2 = list.map((i){
    return "$i";
  });
  List<String> list3 = list2.toList();

}