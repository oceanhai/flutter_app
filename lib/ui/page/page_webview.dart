import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewPage extends StatefulWidget {
  final data;

  WebViewPage(this.data);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  bool isLoad = true;
  FlutterWebviewPlugin flutterWebViewPlugin;

  @override
  void initState() {
    super.initState();
    flutterWebViewPlugin = new FlutterWebviewPlugin();
    ///webview 状态监听
    flutterWebViewPlugin.onStateChanged.listen((state) {
      if (state.type == WebViewState.finishLoad) {
        // 加载完成
        setState(() {
          isLoad = false;
        });
      } else if (state.type == WebViewState.startLoad) {
        setState(() {
          isLoad = true;
        });
      }
    });
  }

  @override
  void dispose() {
    flutterWebViewPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ///WebView插件
    return WebviewScaffold(
        appBar: AppBar(
          title: Text(widget.data['title']),
          ///appbar下边摆放一个进度条
          bottom: PreferredSize(
              //提供一个希望的大小
              preferredSize: const Size.fromHeight(1.0),
              //进度条
              child: const LinearProgressIndicator()),
              //ios 风格进度条 小菊花 TODO 但布局需要调整
              // child: const CupertinoActivityIndicator()),
          ///透明度  加载完:全透明 正在加载:不透明
          bottomOpacity: isLoad ? 1.0 : 0.0,
        ),
        withLocalStorage: true, //缓存，数据存储
        url: widget.data['url'],
        withJavascript: true);
  }
}
