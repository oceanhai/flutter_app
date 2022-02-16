
import 'package:flutter/material.dart';
// import 'ui/page/page_article.dart';

// void main() => runApp(new ArticleApp());
void main() => runApp(new MyApp2());

class ArticleApp extends StatelessWidget {

  String data = "好帅";

  ArticleApp(){
    Future.delayed(Duration(seconds: 3)).then((value) => this.data = "吴海好帅");
  }

  @override
  Widget build(BuildContext context) {
    //①报错
    // return Text("我很帅");

    //② 需要指定方向
    // return Text("我很帅", textDirection: TextDirection.ltr);

    //③ 居中
    // return Center(child: Text("我很帅", textDirection: TextDirection.ltr),);

    //④ materialApp 自带风格
    // return new MaterialApp(
    //   home: Center(child: Text("我很帅"))
    // );

    //⑤ materialApp 自带风格
    // return new MaterialApp(
    //   home: Scaffold(
    //     appBar: AppBar(title: Text("哈哈")),
    //     body: Center(child: Text("我很帅")),
    //   )
    // );

    //⑤ UI变化  不会变 因为继承的StatelessWidget
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("哈哈")),
        body: Center(child: Text(data)),
      )
    );


    // return new MaterialApp(
    //   home: new Scaffold(
    //     appBar: new AppBar(
    //       title: new Text(
    //         '文章',
    //         style: const TextStyle(color: Colors.white),
    //       ),
    //     ),
    //     body: new ArticlePage(),
    //   ),
    // );
  }
}

///UI 变化
class MyApp2 extends StatefulWidget{
  // @override
  // State<StatefulWidget> createState() {
  //   // TODO: implement createState
  //   throw UnimplementedError();
  // }

  @override
  _MyApp2State createState() => _MyApp2State();

}

class _MyApp2State extends State<MyApp2> {
  String data = "好高";

  _MyApp2State(){
    debugPrint("构造方法==========");
    Future.delayed(Duration(seconds: 3)).then((value){
      debugPrint("1111111111111111");
      this.data = "吴海好酷";
      setState(() {
        debugPrint("2222222222222222");
      });
    });

    //不允许在构造方法中setState，因为State都还没有，如何刷新？
    //TODO setState() called in constructor: _MyApp2State#a5ec0(lifecycle state: created, no widget, not mounted)
    // setState(() {
    //   debugPrint("2222222222222222");
    // });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build========");
    return new MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text("哈哈")),
          body: Center(child: Text(data)),
        )
    );
  }

}
