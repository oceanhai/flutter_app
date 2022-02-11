
void main(){
  //can't be represented in 64 bits.
  // int i = 9999999999999999999;

  int i =3;
  print(i.bitLength);//输出位长度 2 十六进制0011

  /**
   * 2字符串
   */
  String str = "快扶我去打王者";

  int num = 11;
  //2.1格式化
  String txt = "${str}s我要找$num号技师";
  print(txt);

  //2.2 单双引号声明
  String s = '我要上王者';
  String s1 = "\"test\"";
  String s2 = '"test"';
  String s3 = "'test'";
  print("$s,$s1,$s2,$s3");

  String s4 = "\\n";
  //r前缀 raw:原始
  s4 = r"\n";
  print("换行符：\n"); // 换行符：\n
  print(r"换行符：\n"); // 换行符：\n  r:不需要转义
  print("换行符：\\n"); // 换行符：\n

  //2.3多行字符串的声明
  String ss = """sss
  ssss
  ssssssss
  ssssss
  sdrsdfsfa""";
  print(ss);

  /**
   * 3、 布尔类型
   */
  bool b = false;

  /**
   * 4、 list 数组
   */
  List<String> list = new List();

  List<int> list1 = [1,2,3,4,5];
  //像java数组一样通过下标取元素
  int item0 = list1[0];

  //遍历数组
  //iter for-in模板
  for (var o in list1) {

  }
  //itar for-i模板
  for (var j = 0; j < txt.length; ++j) {
    var o = txt[j];

  }

  //list对象不可变
  //const 修饰的是[1,2,3]这一个对象，表示这个对象不可变，不能再add元素了
   List<int> list2 = const [1,2,3];
  // list2.add(1);//对象不可变 TODO 编译抛异常
  list2 = [2,3,4];
  //const 修饰的是变量，也就是引用，那么变量就不能够再重新引用其他的对象了
  const List<int> list3 =  [1,2,3];
  // list3 = [2,3,4];//TODO 不可变 提示错误
  // list3.add(11);//TODO 编译抛异常

  /**
   * 映射集合 map
   * Dart（五）Map的属性和方法实例
   * https://www.cnblogs.com/it-tsz/p/12509554.html
   */
  Map<int,int> map = {1:1,2:2,3:3};
  print(map[1]);
  //修改value
  map[1] = 100;
  print(map[1]);
  //添加元素
  map[4] = 4;
  print(map[4]);
  //用const 声明和list是一样的
  var map1 = const {1:1, 2:2};
  // map1[3] = 3;//TODO 添加编译时候报错

  //迭代器的遍历
  map1.forEach((key, value) {
    print('key=$key,value=$value');
  });
  // var keys = map1.keys;

  /**
   * Runes : 特殊字符表示类 （Unicode32）
   */
  var clapping = '\u{1f44f}'; ///5个16进制 需要使用{}
  print(clapping);//👏
//获得 16位代码单元
  print(clapping.codeUnits); //[55357, 56399]
//获得unicode代码
  print(clapping.runes.toList()); //[128079]

//fromCharCode 根据字符码创建字符串
  print( String.fromCharCode(128079));
  print( String.fromCharCodes(clapping.runes));
  print( String.fromCharCodes([55357, 56399]));
  print( String.fromCharCode(0x1f44f));

  Runes input = new Runes(
      '\u2665  \u{1f605}  \u{1f60e}  \u{1f47b}  \u{1f596}  \u{1f44d}');
  print(String.fromCharCodes(input));

  /**
   * Symbols 标识符
   */


  
}