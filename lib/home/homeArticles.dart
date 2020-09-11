
import 'package:flutter/material.dart';

/**
 * 首页tab
 */
class HomeArticles extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomeArticles();
  }
}

class _HomeArticles extends State<HomeArticles>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Home'),
    );
  }

}