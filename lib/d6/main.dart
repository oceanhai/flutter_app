
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
              //TODO 报 Navigator operation requested with a context that does not include a Navigator.
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "第一个页面",
      // home: Builder(builder: build,),//TODO 栈溢出 死循环，敲代码的时候没注意
      home: MainPageDetail(),
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
            onPressed: (){
              //TODO 报 Navigator operation requested with a context that does not include a Navigator.
              Navigator.push(context, MaterialPageRoute(builder: (_){
                return Page2();
              }));

            },
            child: Text("跳转第二个页面"),
          ),
      );
  }

}

class Page2 extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return Text("111111111");
  }
  
}