import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/utils/eventBus.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// webview

/// @author yutiantian email: yutiantina@gmail.com
/// @since 2020/9/15 10:58 AM
class WebBrowser extends StatelessWidget{
  final String title;
  final String url;
  const WebBrowser({Key key, this.title, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.close), onPressed: () => Navigator.pop(context, title)),
            IconButton(icon: Icon(Icons.access_alarm), onPressed: () => EventBus.getInstance().post(Events.webEvent, title))
          ],
        ),
        body: WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
      // 返回 / 导航栏 拦截
      onWillPop: () async {
        EventBus.getInstance().post(Events.webEvent, title);
        return true;
      },
    );
  }
}