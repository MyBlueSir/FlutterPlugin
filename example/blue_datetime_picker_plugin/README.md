# blue_datetime_picker_plugin

## 描述
	时间选择器插件

## 平台支持
	Android IOS WEB

## 效果

![image](https://github.com/MyBlueSir/FlutterPlugin/raw/master/example/blue_datetime_picker_plugin/example1.png)
![image](https://github.com/MyBlueSir/FlutterPlugin/raw/master/example/blue_datetime_picker_plugin/example2.jpg)

## 示例

```flutter
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:blue_datetime_picker_plugin/blue_datetime_picker_plugin.dart';


void main(){
  //debugPaintSizeEnabled = true;      //打开视觉调试开关
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body:BlueTimePicker(
          backgroundColor: Colors.white,
          height: 200,
          textStyle: TextStyle(fontSize: 20,color: Colors.black),
          itemExtent: 28,
          onInitBlueTimePickerChanged: (timeValue){
            print('timeValue.hour:${timeValue.hour} timeValue.minute:${timeValue.minute}');
          },
        ),

      ),
    );
  }
}

```