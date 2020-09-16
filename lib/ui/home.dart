
import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/ui/homeArticles.dart';
import 'package:wanandroid_flutter/ui/homeMe.dart';
import 'package:wanandroid_flutter/ui/homePalace.dart';
import 'package:wanandroid_flutter/utils/aliIcons.dart';

/**
 * 首页
 */
class HomePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }

}

class _HomeState extends State<HomePage>{
  // navigation bar的选择下标
  int _naviTapIndex = 0;
  Widget _body = HomeArticles();
  void _naviSelected(int index){
    setState(() {
      _naviTapIndex = index;
      switch(index){
        case 0: {
          _body = HomeArticles();
          break;
        }
        case 1: {
          _body = HomePalace();
          break;
        }
        case 2: {
          _body = HomeMe();
          break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("玩Android"),
        ),
        bottomNavigationBar: BottomNavigationBar(
          // color: Colors.white,
          // shape: CircularNotchedRectangle(),
          // child: Row(
          //   children: <Widget>[
          //     IconButton(icon: Icon(Icons.home)),
          //     // IconButton(icon: Icon(AliIcons.company)),
          //     SizedBox(),
          //     IconButton(icon: Icon(AliIcons.userCenter))
          //   ],
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          // ),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
            BottomNavigationBarItem(icon: Icon(AliIcons.company), title: Text('广场')),
            BottomNavigationBarItem(icon: Icon(AliIcons.userCenter), title: Text('我'))
          ],
          currentIndex: _naviTapIndex,
          onTap: _naviSelected,
        ),
      body: _body,
    );
  }

}