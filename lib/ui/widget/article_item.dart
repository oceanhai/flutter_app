import 'package:flutter/material.dart';
import 'package:flutter_app/ui/page/page_webview.dart';

class ArticleItem extends StatelessWidget {
  final itemData;

  const ArticleItem(this.itemData);

  @override
  Widget build(BuildContext context) {
    ///时间与作者
    Row author = new Row( //水平线性布局
      children: <Widget>[
        //expanded 最后摆我，相当于linearlayout的weight权重
        new Expanded(
            child: Text.rich(TextSpan(children: [
          TextSpan(text: "作者: "),
          TextSpan(
              text: itemData['author'],
              // style: new TextStyle(color: Theme.of(context).primaryColor))
              // style: new TextStyle(color: Color(0xff000000)))
              style: new TextStyle(color: Colors.black))
        ]))),
        new Text(itemData['niceDate'])//时间
      ],
    );

    ///标题
    Text title = new Text(
      itemData['title'],
      style: new TextStyle(fontSize: 16.0, color: Colors.black),
      textAlign: TextAlign.left,
    );

    ///章节名
    Text chapterName = new Text(itemData['chapterName'],
        style: new TextStyle(color: Theme.of(context).primaryColor));

    Column column = new Column( //垂直线性布局
      crossAxisAlignment: CrossAxisAlignment.start, //子控件左对齐
      children: <Widget>[
        new Padding(
          padding: EdgeInsets.all(10.0),
          child: author,
        ),
        new Padding(
          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          child: title,
        ),
        new Padding(
          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
          child: chapterName,
        ),
      ],
    );

    return new Card(
      ///阴影效果
      elevation: 4.0,
      child: InkWell(
        child: column,
        ///点击事件
        onTap: (){
          ///跳转页面
          Navigator.of(context).push(new MaterialPageRoute(builder: (context){
            ///因为文章用的link 而我们WebViewPage通用用的url，所以这里转一下
            itemData['url'] = itemData['link'];
            return WebViewPage(itemData);
          }));
        },
      ),
    );
  }
}

