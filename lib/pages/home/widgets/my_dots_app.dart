import 'package:flutter/material.dart';
import 'package:nubank_tutorial/pages/home/widgets/my_dot_app.dart';

class MyDotsApp extends StatelessWidget {
  final int currentIndex;
  final double top;

  Color getColor(int index) {
    return index == currentIndex ? Colors.white : Colors.white38;
  }

  const MyDotsApp({Key key, this.currentIndex, this.top}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      child: Row(
        children: <Widget>[
          MyDotApp(
            colorDot: getColor(0),
          ),
          SizedBox(
            width: 8,
          ),
          MyDotApp(
            colorDot: getColor(1),
          ),
          SizedBox(
            width: 8,
          ),
          MyDotApp(
            colorDot: getColor(2),
          ),
        ],
      ),
    );
  }
}
