
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  static const platform =  const MethodChannel('samples.flutter.io/battery');
  String _batteryLevel = 'Unknown battery level.';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              child: Text('Get Battery Level'),
              onPressed: _getBatteryLevel,
            ),
            Text(_batteryLevel)
          ],
        ),
      ),
    );
  }

  Future<Null> _getBatteryLevel() async{
    String batteryLevel;
    try{
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    }on PlatformException catch(e){
      batteryLevel = "Failed to get battery level: '${e.message}'";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

}