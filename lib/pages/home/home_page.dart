import 'package:flutter/material.dart';

import 'widgets/app_bar/my_app_bar.dart';
import 'widgets/bottom_menu/bottom_menu.dart';
import 'widgets/drop_down_menu/menu_app.dart';
import 'widgets/page_view/my_dots_app.dart';
import 'widgets/page_view/page_view_app.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showMenu;
  int _currentIndex;
  double _yPosition;

  @override
  void initState() {
    super.initState();
    _showMenu = false;
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    double _screenHeigth = MediaQuery.of(context).size.height;

    if (_yPosition == null) _yPosition = _screenHeigth * .18;

    return Scaffold(
      backgroundColor: Colors.purple[800],
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          MyAppBar(
            showMenu: _showMenu,
            onTap: () {
              setState(() {
                _showMenu = !_showMenu;
                _yPosition =
                    _showMenu ? _screenHeigth * .85 : _screenHeigth * .17;
              });
            },
          ),
          MenuApp(
            top: _screenHeigth * 0.15,
            showMenu: _showMenu,
          ),
          BottomMenu(
            showMenu: _showMenu,
          ),
          MyDotsApp(
            top: _screenHeigth * 0.7,
            currentIndex: _currentIndex,
            showMenu: _showMenu,
          ),
          PageViewApp(
            top: _yPosition,
            showMenu: _showMenu,
            onChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            onPanUpdate: (details) {
              setState(() {
                double bottomPositionLimit = _screenHeigth * .85;
                double topPositionLimit = _screenHeigth * .18;
                double middlePosition =
                    (bottomPositionLimit - topPositionLimit) / 2;

                _yPosition += details.delta.dy;

                _yPosition = _yPosition < topPositionLimit
                    ? topPositionLimit
                    : _yPosition;

                _yPosition = _yPosition > bottomPositionLimit
                    ? bottomPositionLimit
                    : _yPosition;

                if (_yPosition != bottomPositionLimit && details.delta.dy > 0) {
                  _yPosition = _yPosition > topPositionLimit + middlePosition
                      ? bottomPositionLimit
                      : _yPosition;
                }

                if (_yPosition != topPositionLimit && details.delta.dy < 0) {
                  _yPosition = _yPosition < bottomPositionLimit - middlePosition
                      ? topPositionLimit
                      : _yPosition;
                }
                if (_yPosition == bottomPositionLimit) {
                  _showMenu = true;
                } else if (_yPosition == topPositionLimit) {
                  _showMenu = false;
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
