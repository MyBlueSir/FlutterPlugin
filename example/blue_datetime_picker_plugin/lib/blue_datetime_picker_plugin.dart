

import 'package:blue_datetime_picker_plugin/bluePicker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlueTimePicker extends StatefulWidget{
  final ValueChanged<TimeValue> onInitBlueTimePickerChanged;
  final double height;
  final double width;
  final TextStyle textStyle;
  final double itemExtent;
  final backgroundColor;
  final hourInitialItem;
  final minuteInitialItem;


  BlueTimePicker({
    this.height,
    this.width,
    this.textStyle,
    this.onInitBlueTimePickerChanged, this.itemExtent, this.backgroundColor,
    this.hourInitialItem, this.minuteInitialItem,
  });
  @override
  State createState() => _BlueTimePicker();
}

class TimeValue{
  var hour;
  var minute;
}

class _BlueTimePicker extends State<BlueTimePicker>{
  FixedExtentScrollController hourController;
  FixedExtentScrollController minuteController;
  List hourList = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24];
  List minuteList = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,
    31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59];


  TimeValue timeValue = new  TimeValue();

  @override
  void initState() {
    super.initState();
    initTime();

  }

  initTime(){
    var d = DateTime.now();
    timeValue.hour = d.hour;
    timeValue.minute = d.minute;
    if(widget.hourInitialItem == null || widget.minuteInitialItem == null){
      hourController = new FixedExtentScrollController(initialItem:timeValue.hour -1);
      minuteController = new FixedExtentScrollController(initialItem: timeValue.minute);
    }else{
      hourController = new FixedExtentScrollController(initialItem: widget.hourInitialItem);
      minuteController = new FixedExtentScrollController(initialItem: widget.minuteInitialItem);
    }

    widget.onInitBlueTimePickerChanged(timeValue);

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: widget.height,
      width: widget.width,
      child: Row(
        children: <Widget>[
          new Expanded(
            flex: 1,
            child: BluePicker(
              key: Key('hour'),
              itemExtent: widget.itemExtent,
              scrollController: hourController,
              backgroundColor: widget.backgroundColor,
              onSelectedItemChanged: (int index) {
                setState(() {
                  timeValue.hour = hourList[index];
                  widget.onInitBlueTimePickerChanged(timeValue);
                });
              },
              createWidgetList: (){
                return hourList.map((v) {
                  return new Text(toSmall10add0(v),style: widget.textStyle,);
                }).toList();
              },
            ),
          ),new Expanded(
            flex: 1,
            child: BluePicker(
                key: Key('minute'),
                itemExtent: widget.itemExtent,
                scrollController: minuteController,
                backgroundColor: widget.backgroundColor,
                onSelectedItemChanged: (int index) {
                  setState(() {
                    timeValue.minute = minuteList[index];
                    widget.onInitBlueTimePickerChanged(timeValue);
                  });
                },
              createWidgetList: (){
                return minuteList.map((v) {
                  return new Text(toSmall10add0(v),style: widget.textStyle,);
                }).toList();
              },
            )
          ),

        ],
      ),
    );;
  }
}
