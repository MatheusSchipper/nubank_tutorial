import 'package:flutter/material.dart';

class MyDotApp extends StatelessWidget {

  final Color colorDot;

  const MyDotApp({Key key, this.colorDot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 7,
      width: 7,
      decoration: BoxDecoration(
        color: colorDot,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
