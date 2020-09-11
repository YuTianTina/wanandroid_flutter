
import 'package:flutter/material.dart';

/**
 * 首页tab
 */
class HomeMe extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomeMe();
  }
}

class _HomeMe extends State<HomeMe>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Me'),
    );
  }

}