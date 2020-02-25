import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef List<Widget>CreateWidgetList();
String toSmall10add0(int i){
if(i<10){return '0' + i.toString();}else{return i.toString();}
}

class BluePicker extends StatefulWidget {
  final CreateWidgetList createWidgetList;
  final ValueChanged<int> onSelectedItemChanged;
  final scrollController;
  final backgroundColor;
  final Key key;
  final double itemExtent;

  BluePicker({this.createWidgetList, this.onSelectedItemChanged, this.key, this.itemExtent, this.backgroundColor, this.scrollController});

  @override
  State createState() {
    return _BluePickerState();
  }
}

class _BluePickerState extends State<BluePicker> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new CupertinoPicker(
        key: widget.key,
        scrollController: widget.scrollController,
        backgroundColor: widget.backgroundColor,
        itemExtent: widget.itemExtent,
        onSelectedItemChanged: (index) {
          if (widget.onSelectedItemChanged != null) {
            widget.onSelectedItemChanged(index);
          }
        },
        children: widget.createWidgetList()
      ),
    );
  }
}