import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}