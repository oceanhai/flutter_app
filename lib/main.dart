import 'package:flutter/material.dart';
import 'package:flutter_app/ui/page/page_article.dart';

void main() => runApp(new ArticleApp());

class ArticleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(
            'wuhai',
            style: const TextStyle(color: Colors.white),
          ),
        ),
        body: new ArticlePage(),
      ),
      // theme:ThemeData(primaryColor:Colors.red ) ,
      theme:ThemeData(primaryColor:Color(0xff0066ff) ) ,
    );
  }
}


