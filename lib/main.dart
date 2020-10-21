import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wanandroid_flutter/ui/home.dart';
import 'package:wanandroid_flutter/web/webBrowser.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '玩Android',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // routes: {
      //   "webBrowser": (context){
      //     var params = ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
      //     return WebBrowser(title: params["title"], url: params["url"]);
      //   }
      // },

      // 命名路由拦截钩子
      onGenerateRoute: (RouteSettings setting){
        var params = setting.arguments as Map<String, dynamic>;
        if(setting.name == "webBrowser"){
          Fluttertoast.showToast(msg: "haha");
          return MaterialPageRoute(builder: (context){
            return WebBrowser(title: params["title"], url: params["url"]);
          });
        }else{
          return null;
        }
      },
      home: HomePage(),
    );
  }
}

