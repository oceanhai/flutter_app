
import 'package:flutter/material.dart';

void main() => runApp(MainPage());

class MainPage extends StatelessWidget{

  //①跳转报错
  //Navigator.push 在匿名方法，并不处于details tree中
  //MainPage 需要上下文 就得自己创建Navigator，从而放弃了MaterialApp里包含的样式等等
  // @override
  // Widget build(BuildContext context) {
  //   //TODO 我们这里打个断点，上下文context：MainPage(dirty) MainPage里无Navigator
  //   return MaterialApp(
  //     title: "第一个页面",
  //     home: Scaffold(
  //       appBar: AppBar(
  //         title: Text("第一个页面"),
  //       ),
  //       body: Column(
  //         children: [
  //           RaisedButton(
  //             onPressed: (){
  //               //TODO 报 Navigator operation requested with a context that does not include a Navigator.
  //               Navigator.push(context, MaterialPageRoute(builder: (_){
  //                 return Page2();
  //               }));
  //
  //             },
  //             child: Text("跳转第二个页面"),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget builder(BuildContext context){
    //TODO 打个断点，可以看到 上下文是context : Builder(dirty)
    //TODO 上下文是Builder，他的父层是MaterialApp，而MaterialApp里有Navigator，所以可以跳转
    return Scaffold(
      appBar: AppBar(
        title: Text("第一个页面"),
      ),
      body: Column(
        children: [
          RaisedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_){
                return Page2();
              }));

            },
            child: Text("跳转第二个页面"),
          )
        ],
      ),
    );
  }

  //② 用Builder 包装一下
  //想法设法 获得MaterialApp的上下文，去看builder的TODO描述
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: "第一个页面",
  //     // home: Builder(builder: build,),//TODO 栈溢出 死循环，敲代码的时候没注意
  //     home: Builder(builder: builder,),
  //   );
  // }

  //③ MainPageDetail 父，MaterialApp 也能正常跳转
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: "第一个页面",
  //     // home: Builder(builder: build,),//TODO 栈溢出 死循环，敲代码的时候没注意
  //     home: MainPageDetail(),
  //   );
  // }

  //④ 路由 routes
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        //默认首页的路由地址就是/,如果路由表 包含/ 那就别指定home属性
        "/":(_){
          // return MainPageDetail();//TODO 擦 我发现这样依然也可以用以前的跳转
          return MainPageDetailRouter();
        },
        "/page2":(_)=>Page2()
      },
      title: "第一个页面",
    );
  }

}

class MainPageDetail extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第一个页面"),
      ),
      body: RaisedButton(
            onPressed: () async{
              //①方式一 接受下一个页面返回信息 then ==》类似Android startActivityForResult
              // Navigator.push(context, MaterialPageRoute(builder: (_){
              //   return Page2();
              // })).then((value) => debugPrint(value.toString()));

              //②方式二 接受下一个页面返回信息 async+await ==》类似Android startActivityForResult
              person p = await Navigator.push(context, MaterialPageRoute(builder: (_){
                return Page2();
              }));
              debugPrint("p=$p");

            },
            child: Text("跳转第二个页面"),
          ),
      );
  }

}

class MainPageDetailRouter extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第一个页面"),
      ),
      body: RaisedButton(
        onPressed: () {
          //TODO ※用路由的形式，async+await模式就行不通了，报错
          Navigator.pushNamed(context, "/page2")
              .then((value) => debugPrint("pushNamed走路由 p=$value"));
        },
        child: Text("跳转第二个页面"),
      ),
    );
  }

}

class person{
  var name;
  var age;
  person(this.name, this.age);

  @override
  String toString() {
    return 'person{name: $name, age: $age}';
  }
}

class Page2 extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第二个页面"),
      ),
      body: RaisedButton(onPressed: (){
        //返回页面
        // Navigator.pop(context);
        //返回数据给前一个界面
        Navigator.pop(context, person("吴海", 18));
      },
      child: Text("返回"),
      ),
    );
  }
  
}