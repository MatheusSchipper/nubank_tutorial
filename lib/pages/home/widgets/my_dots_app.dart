import 'package:flutter/material.dart';
import 'package:nubank_tutorial/pages/home/widgets/my_dot_app.dart';

class MyDotsApp extends StatelessWidget {
  final int currentIndex;
  final double top;
  final bool showMenu;

  Color getColor(int index) {
    return index == currentIndex ? Colors.white : Colors.white38;
  }

  const MyDotsApp({Key key, this.currentIndex, this.top, this.showMenu}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      child: AnimatedOpacity(
        opacity: showMenu ? 0 : 1,
        duration: Duration(milliseconds: 200),
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
      ),
    );
  }
}
